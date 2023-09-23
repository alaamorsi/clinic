class DoctorModel {
  late String name;
  late String email;
  late String phone;
  late String specialty;
  late String experience;
  late String workDays;
  late String workHours;
  late String dPrice;
  late String rPrice;
  late String uid;
  late String image;
  late String address;
  late bool isEmailVerified;

  DoctorModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.experience,
    required this.specialty,
    required this.image,
    required this.address,
    required this.isEmailVerified,
    required this.dPrice,
    required this.rPrice,
    required this.workDays,
    required this.workHours
  });

  DoctorModel.fromJson(Map<String,dynamic>?json,{data})
  {
    uid=json!['uid'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    address=json['address'];
    specialty=json['specialty'];
    experience=json['experience'];
    workHours=json['workHours'];
    workDays=json['workDays'];
    dPrice=json['kPrice'];
    rPrice=json['rPrice'];
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
      'specialty':specialty,
      'experience':experience,
      'workDays':workDays,
      'workHours':workHours,
      'dPrice':dPrice,
      'rPrice':rPrice,
      'isEmailVerified':isEmailVerified,
    };
  }

}