class User {
  var id;
  var name;
  var username;
  var email;
  var password;
  var gender;
  var birthdate;
  var phoneNumber;
  var profile_image;
  var town;
  var level;
  var speciality;
  var school;
  var domain;

  User(
      {id,
      name,
      username,
      email,
      password,
      gender,
      birthdate,
      phoneNumber,
      profile_image,
      town});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    phoneNumber = json['phoneNumber'];
    profile_image = json['profile_image'];
    town = json['town'];
    level = json['level'];
    speciality = json['speciality'];
    school = json['school'];
    domain = json['domain'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'gender': gender,
      'birthdate': birthdate,
      'phoneNumber': phoneNumber,
      'profile_image': profile_image,
      'town': town,
      'level': level,
      'speciality': speciality,
      'school': school,
      'domain': domain,
    };
  }
}
