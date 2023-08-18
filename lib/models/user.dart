class User {
  var first_name;
  var last_name;
  var email;
  var password;
  var gender;
  var birthdate;
  var phone_number;
  var profile_image;

  User(
      {first_name,
      last_name,
      email,
      password,
      gender,
      birthdate,
      phone_number,profile_image});

  User.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    phone_number = json['phone_number'];
    profile_image = json['profile_image'];
  }
}
