class ApiEndponits {
  final String baseUrl = "https://api.digihealthsarl.com/api";
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
}
