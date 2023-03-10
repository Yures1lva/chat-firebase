import 'dart:async';
import 'dart:math';
import 'package:chat_firebase/core/models/chat_message.dart';
import 'package:chat_firebase/core/services/chat/chat_service.dart';

import '../../models/chat_user.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    // ChatMessage(
    //     id: "1",
    //     text: "Bom dia",
    //     createAt: DateTime.now(),
    //     userId: "123",
    //     userName: "Bia",
    //     userImageURL: "assets/images/avatar.png"),
    // ChatMessage(
    //     id: "2",
    //     text: "Bom dia teremos reunião?",
    //     createAt: DateTime.now(),
    //     userId: "456",
    //     userName: "Ana",
    //     userImageURL: "assets/images/avatar.png"),
    // ChatMessage(
    //     id: "1",
    //     text: "Sim pode ser agr",
    //     createAt: DateTime.now(),
    //     userId: "123",
    //     userName: "jão",
    //     userImageURL: "assets/images/avatar.png"),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagsStream() {
    return _msgStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    _msgs.add(newMessage);

    _controller?.add(_msgs.reversed.toList());

    return newMessage;
  }
}
