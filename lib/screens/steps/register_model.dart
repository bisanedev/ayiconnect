class RegisterForm {
  RegisterForm({
    required this.role,
    required this.personal,
    required this.professional,
  });
  late final int role;
  late final Personal personal;
  late final Professional professional;
  
  RegisterForm.fromJson(Map<String, dynamic> json){
    role = json['role'];
    personal = Personal.fromJson(json['personal']);
    professional = Professional.fromJson(json['professional']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['role'] = role;
    _data['personal'] = personal.toJson();
    _data['professional'] = professional.toJson();
    return _data;
  }
}

class Personal {
  Personal({
    required this.fullName,
    required this.gender,
    required this.dateBirth,
    required this.phoneNumber,
    required this.currentLoc,
  });
  late final String fullName;
  late final int gender;
  late final String dateBirth;
  late final int phoneNumber;
  late final String currentLoc;
  
  Personal.fromJson(Map<String, dynamic> json){
    fullName = json['fullName'];
    gender = json['gender'];
    dateBirth = json['dateBirth'];
    phoneNumber = json['phoneNumber'];
    currentLoc = json['currentLoc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['gender'] = gender;
    _data['dateBirth'] = dateBirth;
    _data['phoneNumber'] = phoneNumber;
    _data['currentLoc'] = currentLoc;
    return _data;
  }
}

class Professional {
  Professional({
    required this.occupation,
    required this.company,
    required this.spoken,
    required this.service,
    required this.aboutYou,
  });
  late final String occupation;
  late final String company;
  late final List<int> spoken;
  late final int service;
  late final String aboutYou;
  
  Professional.fromJson(Map<String, dynamic> json){
    occupation = json['occupation'];
    company = json['company'];
    spoken = List.castFrom<dynamic, int>(json['spoken']);
    service = json['service'];
    aboutYou = json['aboutYou'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['occupation'] = occupation;
    _data['company'] = company;
    _data['spoken'] = spoken;
    _data['service'] = service;
    _data['aboutYou'] = aboutYou;
    return _data;
  }
}