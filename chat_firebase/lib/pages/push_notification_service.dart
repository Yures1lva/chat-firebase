import 'package:chat_firebase/core/models/chat_notfication.dart';
import 'package:flutter/material.dart';

class PushNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];
  List<ChatNotification> get item {
    return [..._items];
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int i) {
    _items.remove(i);
    notifyListeners();
  }
}
