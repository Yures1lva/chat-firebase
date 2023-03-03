import 'package:chat_firebase/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Chat page"),
            TextButton(
                onPressed: () {
                  AuthMockServie().logout();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
