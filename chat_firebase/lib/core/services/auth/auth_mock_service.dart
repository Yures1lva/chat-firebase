import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chat_firebase/core/services/auth/auth_service.dart';

import '../../models/chat_user.dart';

class AuthMockServie implements AuthService {

  static final _defaultuser = ChatUser(name: "name", email: "arroz@gmail.com", id: "1", imageUrl: "assets/image/avatar.png",);

  // ignore: prefer_final_fields
  static Map<String, ChatUser> _users = {
    _defaultuser.email: _defaultuser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultuser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> singUp(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = ChatUser(
        name: name,
        email: email,
        id: Random().nextDouble().toString(),
        imageUrl: image?.path ?? 'assets/images/avatar.png');

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
