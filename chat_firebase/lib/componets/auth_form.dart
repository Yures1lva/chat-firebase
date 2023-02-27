import 'package:chat_firebase/models/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    _formkey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                if (_formData.isSingup)
                  TextFormField(
                    key: ValueKey("name"),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                TextFormField(
                  key: ValueKey("email"),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                TextFormField(
                  key: ValueKey("password"),
                  initialValue: _formData.password,
                  onChanged: (password) => _formData.password = password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: _submit,
                    child: Text(_formData.isLogin ? "Entrar" : "Cadastrar")),
                TextButton(
                    child: Text(_formData.isLogin
                        ? "Criar uma nova conta?"
                        : 'Já possui conta?'),
                    onPressed: () {
                      setState(() {
                        _formData.toggleAuthMode();
                      });
                    })
              ],
            )),
      ),
    );
  }
}
