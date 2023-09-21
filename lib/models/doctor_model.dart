class DoctorModel {
  late String name;
  late String email;
  late String phone;
  late String uid;
  late String image;
  late String address;
  late bool isEmailVerified;

  DoctorModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.image,
    required this.address,
    required this.isEmailVerified,
  });

  DoctorModel.fromJson(Map<String,dynamic>?json,{data})
  {
    uid=json!['uid'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    address=json['address'];
    isEmailVerified=json['isEmailVerified'];
  }

  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'image':image,
      'address':address,
      'isEmailVerified':isEmailVerified,
    };
  }

}