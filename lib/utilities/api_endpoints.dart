class ApiEndponits {
  final String baseUrl = "https://api.digihealthsarl.com/api";
  // final String baseUrl = "http://restapi.adequateshop.com/api/AuthAccount";
  final authEndpoints = AuthEndpoints();
}

class AuthEndpoints {
  final String registerEmail = "/register";
  final String loginEmail = "/login";
  final String password = "/forgot-password";
  final String resetPassword = "/reset-password";
}
