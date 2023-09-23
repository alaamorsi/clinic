// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/modules/doctor_modules/profile.dart';
import 'package:myclinic/modules/doctor_modules/reservations.dart';
import 'package:myclinic/modules/doctor_modules/reserve_now.dart';
import 'package:myclinic/modules/doctor_modules/search.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit():super(DoctorInitialStates());
  static DoctorCubit get(context)=>BlocProvider.of(context);

  String? uid;

  late DoctorModel userModel;
  void getDoctorDate()
  {
    emit(GetDoctorDataLoadingState());
    FirebaseFirestore.instance.collection('doctors').doc(uid)
        .get()
        .then((value){
      userModel = DoctorModel.fromJson(value.data());
      emit(GetDoctorDataSuccessState());
    })
        .catchError((error){
      emit(GetDoctorDataErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens =[
    ReservationsScreen(),
    SearchScreen(),
    ReserveNowScreen(),
    ProfileScreen(),
  ];
  List<String> titles=[
    'الحجوزات',
    'البحث',
    'احجز الأن',
    'الملف الشخصي',
  ];
  void changeBottomNav(int index)
  {
    currentIndex =index;
    emit(DoctorChangeBottomNavState());
  }

  bool resIsSelect = true;
  void changeReservesButton()
  {
    resIsSelect = !resIsSelect;
    emit(DoctorChangeReserveListState());
  }
  //
  // File? profileImage;
  // var picker = ImagePicker();
  //
  // Future<void> getProfileImage() async
  // {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     profileImage = File(pickedFile.path);
  //     emit(SocialProfileImagePickedSuccessState());
  //   }
  //   else{
  //     print('No Image Selected');
  //     emit(SocialProfileImagePickedErrorState());
  //   }
  // }
  //
  // void uploudProfileImage({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // })
  // {
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
  //       .putFile(profileImage!)
  //       .then((val){
  //     val.ref.getDownloadURL()
  //         .then((value) {
  //       emit(SocialUploudProfileImageSuccessState());
  //       updateUser(name: name,phone: phone,bio: bio,image: value);
  //     })
  //         .catchError((error){
  //       emit(SocialUploudProfileImageErrorState());
  //     });
  //   })
  //       .catchError((error){
  //     emit(SocialUploudProfileImageErrorState());
  //   });
  // }

  // void updateUserImages(
  //     {
  //       required String name,
  //       required String phone,
  //       required String bio,
  //     }
  //     )
  // {
  //   emit(SocialUserUpdateDataLoadingState());
  //   if (profileImage != null) {
  //     uploudProfileImage(name: name, phone: phone, bio: bio);
  //   }
  //   else {
  //     updateUser(
  //         name: name,
  //         phone: phone,
  //         bio: bio);
  //   }
  // }

  // void updateUser({
  //   required String name,
  //   required String phone,
  //   required String bio,
  //   String? image,
  // }
  //     ){
  //   SocialUserModel model = SocialUserModel(
  //     name: name,
  //     phone: phone,
  //     bio: bio,
  //     image: image??userModel.image,
  //     isEmailVerified: false,
  //     email: userModel.email,
  //     uid: userModel.uid,
  //   );
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userModel.uid)
  //       .update(model.toMap())
  //       .then((value)
  //   {
  //     getUserDate();
  //   })
  //       .catchError((error)
  //   {
  //     emit(SocialUserUpdateDataErrorState());
  //   });
  // }

  // File? postImage;
  // Future<void> getPostImage() async
  // {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profileImage = File(pickedFile.path);
  //     emit(SocialPostImagePickedSuccessState());
  //   }
  //   else{
  //     print('No Image Selected');
  //     emit(SocialPostImagePickedErrorState());
  //   }
  // }

  // void removePostImage()
  // {
  //   postImage = null;
  //   emit(SocialRemovePostImageState());
  // }

  // void uploudPostImage({
  //   required String dateTime,
  //   required String text,
  // })
  // {
  //   emit(SocialCreatePostLoadingState());
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
  //       .putFile(postImage!)
  //       .then((val){
  //     val.ref.getDownloadURL()
  //         .then((value) {
  //       createPost(dateTime: dateTime, text: text,postImage: value);
  //     })
  //         .catchError((error){
  //       emit(SocialCreatePostErrorState());
  //     });
  //   })
  //       .catchError((error){
  //     emit(SocialCreatePostErrorState());
  //   });
  // }

//   void createPost({
//     required String dateTime,
//     required String text,
//     String? postImage,
//   }
//       ){
//     emit(SocialCreatePostLoadingState());
//     SocialPostModel model = SocialPostModel(
//       name: userModel.name,
//       uid: userModel.uid,
//       image: userModel.image,
//       dateTime: dateTime,
//       text: text,
//       postImage: postImage??'',);
//     FirebaseFirestore.instance
//         .collection('posts')
//         .add(model.toMap())
//         .then((value)
//     {
//       emit(SocialCreatePostSuccessState());
//     })
//         .catchError((error)
//     {
//       emit(SocialCreatePostErrorState());
//     });
//   }
//
//   List<SocialPostModel>posts=[];
//   List<String>postsId=[];
//   List<int> likes =[];
//   List<bool> isLike =[];
//   List<int> commentsNumber=[];
//   List<CommentModel> comments=[];
//
//   void getPosts()
//   {
//     emit(SocialGetPostsLoadingState());
//     FirebaseFirestore.instance
//         .collection('posts')
//         .snapshots()
//         .listen((event)
//     {
//       posts=[];
//       likes=[];
//       commentsNumber=[];
//       event.docs.forEach((element)
//       {
//         isLike=[];
//         postsId.add(element.id);
//         posts.add(SocialPostModel.fromJson(element.data()));
//         element.reference
//             .collection('likes')
//             .snapshots()
//             .listen((event) {
//           likes.add(event.docs.length);
//           event.docs.forEach((element){
//             if (element.id == userModel.uid)
//             {
//               if (element['like'])
//               {
//                 isLike.add(true);
//               }
//               else isLike.add(false);
//             }
//           });
//         });
//         element.reference
//             .collection('comments')
//             .snapshots()
//             .listen((event) {
//           commentsNumber.add(event.docs.length);
//         });
//       });
//       emit(SocialGetPostsSuccessState());
//     });
//   }
//
//   void likePost(String postId)
//   {
//     FirebaseFirestore.instance
//         .collection('posts')
//         .doc(postId)
//         .collection('likes')
//         .doc(userModel.uid)
//         .get().then((value){
//       if(value['like']==true)
//       {
//         emit(SocialLikePostSuccessState());
//         FirebaseFirestore.instance
//             .collection('posts')
//             .doc(postId)
//             .collection('likes')
//             .doc(userModel.uid)
//             .set({'like':false,});
//       }
//       else
//       {
//         emit(SocialLikePostSuccessState());
//         FirebaseFirestore.instance
//             .collection('posts')
//             .doc(postId)
//             .collection('likes')
//             .doc(userModel.uid)
//             .set({'like':true,});
//       }
//     });
//   }
//
//   void createComment({
//     required String postId,
//     required String comment,
//   }
//       ){
//     CommentModel commentModel = CommentModel(
//         name: userModel.name,
//         uid: userModel.uid,
//         image:userModel.image,
//         comment: comment,
//         dateTime:DateTime.now().toString());
//
//     emit(SocialCreateCommentLoadingState());
//     FirebaseFirestore.instance
//         .collection('posts')
//         .doc(postId)
//         .collection('comments')
//         .add(commentModel.toMap())
//         .then((value)
//     {
//       emit(SocialCreateCommentSuccessState());
//     })
//         .catchError((error)
//     {
//       emit(SocialCreateCommentErrorState(error));
//     });
//   }
//
//   void getComments(String postId)
//   {
//     emit(SocialGetCommentsLoadingState());
//     //go to the posts collection
//     FirebaseFirestore.instance
//         .collection('posts').doc(postId).collection('comments').snapshots().listen((event)
//     {
//       comments =[];
//       event.docs.forEach((element)
//       {
//         comments.add(CommentModel.fromJson(element.data()));
//       });
//       emit(SocialGetCommentsSuccessState());
//     });
//   }
//
//   List<SocialUserModel> users=[];
//
//   void getUsers()
//   {
//     users=[];
//     if (users.isEmpty) {
//       FirebaseFirestore.instance
//           .collection('users')
//           .snapshots()
//           .listen((event) {
//         event.docs.forEach((element)
//         {
//           if (element.data()['uid'] != userModel.uid)
//             users.add(SocialUserModel.fromJson(element.data()));
//         });
//         emit(SocialGetAllUsersSuccessState());
//       });
//     }
//   }
//
//   void sendMessage(
//       {
//         required String receiverId,
//         required String dateTime,
//         required String message,
//       }
//       )
//   {
//     MessageModel model = MessageModel(
//         senderId: userModel.uid,
//         receiverId: receiverId,
//         dateTime: dateTime,
//         message: message);
//     //set chat to me
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(userModel.uid)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('messages')
//         .add(model.toMap())
//         .then((value)
//     {
//       emit(SocialSendMessageSuccessState());
//     })
//         .catchError((error)
//     {
//       emit(SocialSendMessageErrorState());
//     });
//     //set chat to reciver
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(receiverId)
//         .collection('chats')
//         .doc(userModel.uid)
//         .collection('messages')
//         .add(model.toMap())
//         .then((value)
//     {
//       emit(SocialSendMessageSuccessState());
//     })
//         .catchError((error)
//     {
//       emit(SocialSendMessageErrorState());
//     });
//   }
//
//   List<MessageModel> messages=[];
//
//   void getMessages(receiverId)
//   {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(userModel.uid)
//         .collection('chats')
//         .doc(receiverId)
//         .collection('messages')
//         .orderBy('dateTime')
//         .snapshots()
//         .listen((event)
//     {
//       messages =[];
//       event.docs.forEach((element)
//       {
//         messages.add(MessageModel.fromJson(element.data()));
//       });
//       emit(SocialGetMessagesSuccessState());
//     });
//   }
//
//   void clearCommentFiled(TextEditingController tx)
//   {
//     tx.clear();
//     emit(SocialclearCommentFiledState());
//   }
 }