import 'dart:io';

enum AuthMode { Singnup, Login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSingup {
    return _mode == AuthMode.Singnup;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.Singnup : AuthMode.Login;
  }
}
