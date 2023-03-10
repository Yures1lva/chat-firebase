import 'package:chat_firebase/core/services/chat/chat_mock_service.dart';

import '../../models/chat_message.dart';
import '../../models/chat_user.dart';

abstract class ChatService {
  
  Stream<List<ChatMessage>> messagsStream();

  Future<ChatMessage> save(String text, ChatUser user);

  factory ChatService(){
    return ChatMockService();
  }
}