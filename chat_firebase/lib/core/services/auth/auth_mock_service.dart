import 'dart:ffi';
import 'dart:io';

import 'package:chat_firebase/core/services/auth/auth_service.dart';

import '../../models/chat_user.dart';

class AuthMockServie implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  ChatUser? get currentUser {
    return _currentUser;
  }

  Stream<ChatUser?> get userChanges {}

  Future<void> singUp(
    String nome,
    String email,
    String password,
    File image,
  ) async {}
  Future<void> login(
    String email,
    String password,
  ) async {}
  Future<void> logout() async {}
}
