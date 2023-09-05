class ApiEndponits {
  final String baseUrl = "https://api.digihealthsarl.com/api";
  final String sendPushNotificationUrl = "https://fcm.googleapis.com/fcm/send";
  // final String baseUrl = "http://restapi.adequateshop.com/api/AuthAccount";
  final authEndpoints = AuthEndpoints();
  final endpoints = Endpoints();
}

class AuthEndpoints {
  final String registerEmail = "/register";
  final String loginEmail = "/login";
  final String password = "/forgot-password";
  final String resetPassword = "/reset-password";
}

class Endpoints {
  final String currentUser = "/user/me";
  final String updateUser = "/user/profile/";
  final String quizList = "/quiz/category/";
  final String categories = "/categories";
  final String updatePassword = "/user/password";
  final String domain = "/domains";
  final String school = "/schools";
  final String level = "/levels";
  final String specialities = "/specialities";
  final String quiz = "/quiz";
}
