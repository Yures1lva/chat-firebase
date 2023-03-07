import 'package:chat_firebase/componets/messages.dart';
import 'package:chat_firebase/componets/new_messages.dart';
import 'package:chat_firebase/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cod3r chat",),
        actions: [
          
          DropdownButton(
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryIconTheme.color,
          ),
          items: <DropdownMenuItem>[
            DropdownMenuItem(
              
              value: "logout",
              child: Container(child: Row(
              children: [
                Icon(Icons.exit_to_app, color: Theme.of(context).primaryColorDark,),
                SizedBox(
                  width: 10,
                ),
                Text("sair", style: TextStyle(color: Theme.of(context).primaryColorDark,),)
              ],
            ),),)
          ],
          onChanged: (value) {
            if(value == 'logout'){
              AuthService().logout();
            }
          },
           )
        ],
      ),
      body: SafeArea(child: Column(
        children: [
          Expanded(child: Messages()),
          NewMessages(),
        ],
      ))
    );
  }
}
