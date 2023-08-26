class User {
  var id;
  var first_name;
  var last_name;
  var email;
  var password;
  var gender;
  var birthdate;
  var phone_number;
  var profile_image;
  var address;

  User(
      {id,
      first_name,
      last_name,
      email,
      password,
      gender,
      birthdate,
      phone_number,
      profile_image,
      address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    phone_number = json['phone_number'];
    profile_image = json['profile_image'];
    address = json['address'];
  }
}
