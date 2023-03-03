import 'package:chat_firebase/core/models/chat_user.dart';
import 'package:chat_firebase/core/services/auth/auth_mock_service.dart';
import 'package:chat_firebase/pages/auth_page.dart';
import 'package:chat_firebase/pages/chat_page.dart';
import 'package:chat_firebase/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthAppPAge extends StatelessWidget {
  const AuthAppPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockServie().userChanges,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        }),
      ),
    );
  }
}
