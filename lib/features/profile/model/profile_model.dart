class ProfileModel{
  String? fullName;
  String? email;
  String? phoneNumber;
  String? supervisorName;
  String? dateOfBirth;

  ProfileModel(this.dateOfBirth,this.email,this.fullName,this.phoneNumber,this.supervisorName);

  ProfileModel.fromJson(Map<String, dynamic> json){
    fullName = json['data']['full_name'];
    email = json['data']['email'];
    phoneNumber = json['data']['mobile_number'];
    supervisorName = json['data']['parent_user']['full_name'];
    dateOfBirth = json['data']['dob'];

  }

}