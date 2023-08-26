class LoginAuth {
  String message;
  TokenAuth data;
  LoginAuth({required this.message, required this.data});
  LoginAuth.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = TokenAuth.fromJson(json['data']);
}

class TokenAuth {
  String token;
  TokenAuth({required this.token});
  TokenAuth.fromJson(Map<String, dynamic> data) : token = data['token'];
}

class User {
  String name;
  String email;
  User({required this.name, required this.email});
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        email = json['email'] ?? "";
}

class Users {
  String name;
  String email;
  Users({required this.name, required this.email});
  Users.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        email = json['email'] ?? "";
}

class Logout {
  String message;
  Logout({required this.message});
  Logout.fromJson(Map<String, dynamic> json) : message = json['message'];
}
