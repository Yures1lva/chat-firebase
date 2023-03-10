import 'dart:io';

import 'package:chat_firebase/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.belongsToCurrentUser,
    required this.message,
  });
  static const _defaultImage = "assets/images/avatar.png";
  final ChatMessage message;
  final bool belongsToCurrentUser;

  Widget _showUserImage(String imageUrl) {
    ImageProvider? provider;
    final uri = Uri.parse(imageUrl);

    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5),
                    topRight: const Radius.circular(5),
                    bottomLeft: belongsToCurrentUser
                        ? const Radius.circular(5)
                        : const Radius.circular(0),
                    bottomRight: belongsToCurrentUser
                        ? const Radius.circular(0)
                        : const Radius.circular(5),
                  ),
                  color: belongsToCurrentUser
                      ? Colors.grey.shade300
                      : Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: belongsToCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    textAlign:
                        belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            belongsToCurrentUser ? Colors.black : Colors.white),
                  ),
                  Text(message.text),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: belongsToCurrentUser ? null : 165,
            right: belongsToCurrentUser ? 165 : null,
            child: _showUserImage(message.userImageURL)),
      ],
    );
  }
}
