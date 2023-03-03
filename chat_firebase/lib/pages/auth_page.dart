import 'package:chat_firebase/componets/auth_form.dart';
import 'package:chat_firebase/core/models/auth_form_data.dart';
import 'package:chat_firebase/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        // login
        await AuthMockServie().login(formData.email, formData.password);
      } else {
        //singUp
        await AuthMockServie().singUp(
            formData.name, formData.email, formData.password, formData.image);
      }
    } catch (error) {
      setState(() {});
    } finally {
      setState((() => _isLoading = false));
    }
    // setState(() => _isLoading = true);
    // setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              // ignore: prefer_const_constructors
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.8)),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
