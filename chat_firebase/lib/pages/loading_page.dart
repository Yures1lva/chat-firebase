import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 8,
          ),
          // ignore: prefer_const_constructors
          CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            "carregando...",
            style: TextStyle(
                color: Theme.of(context).primaryTextTheme.headline6?.color,
                fontSize:
                    Theme.of(context).primaryTextTheme.headline5?.fontSize),
          ),
          const Spacer(
            flex: 8,
          ),
        ],
      )),
    );
  }
}
