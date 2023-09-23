abstract class DoctorStates {}

class DoctorInitialStates extends DoctorStates {}

class DoctorChangeBottomNavState extends DoctorStates {}

class DoctorChangeReserveListState extends DoctorStates{}

class SocialNewPostState extends DoctorStates {}

// ///////////////////////////////////////
//get user
class GetDoctorDataLoadingState extends DoctorStates {}
class GetDoctorDataSuccessState extends DoctorStates {}
class GetDoctorDataErrorState extends DoctorStates {
  final String error;
  GetDoctorDataErrorState(this.error);
}

// //get all user
// class SocialGetAllUsersSuccessState extends DoctorStates {}
// class SocialGetAllUsersErrorState extends DoctorStates {
//   final String error;
//   SocialGetAllUsersErrorState(this.error);
// }
// //messages filed states
// class SocialSendMessageSuccessState extends DoctorStates {}
// class SocialSendMessageErrorState extends DoctorStates {}
// class SocialGetMessagesSuccessState extends DoctorStates {}

// //create post
// class SocialPostImagePickedSuccessState extends SocialStates {}
// class SocialPostImagePickedErrorState extends SocialStates {}
// class SocialCreatePostLoadingState extends SocialStates {}
// class SocialCreatePostSuccessState extends SocialStates {}
// class SocialCreatePostErrorState extends SocialStates {}
// class SocialRemovePostImageState extends SocialStates {}
//
// //get posts
// class SocialGetPostsLoadingState extends SocialStates {}
// class SocialGetPostsSuccessState extends SocialStates {}
// class SocialGetPostsErrorState extends SocialStates {
//   final String error;
//   SocialGetPostsErrorState(this.error);
// }
//
// //for likes
// class SocialLikePostSuccessState extends SocialStates {}
// class SocialLikePostErrorState extends SocialStates {
//   final String error;
//   SocialLikePostErrorState(this.error);
// }
//
// //create comment
// class SocialCreateCommentLoadingState extends SocialStates {}
// class SocialCreateCommentSuccessState extends SocialStates {}
// class SocialCreateCommentErrorState extends SocialStates {
//   final String error;
//   SocialCreateCommentErrorState(this.error);
// }
//
// ////////////////////
// class SocialShowSendCommentIconState extends SocialStates {}
// class SocialclearCommentFiledState extends SocialStates {}
// ///////////////////
//
// //get comments
// class SocialGetCommentsLoadingState extends SocialStates {}
// class SocialGetCommentsSuccessState extends SocialStates {}
// class SocialGetCommentsErrorState extends SocialStates {}
//
// ////////////////////////////////////////////////////////////////
// //pike profile image
// class SocialProfileImagePickedSuccessState extends SocialStates {}
// class SocialProfileImagePickedErrorState extends SocialStates {}
//
// //upload profile image
// class SocialUploudProfileImageSuccessState extends SocialStates {}
// class SocialUploudProfileImageErrorState extends SocialStates {}
//
// //update user data
// class SocialUserUpdateDataLoadingState extends SocialStates {}
// class SocialUserUpdateDataErrorState extends SocialStates {}
//
