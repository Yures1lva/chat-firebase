import 'dart:io';

import 'package:chat_firebase/componets/user_image_picker.dart';
import 'package:chat_firebase/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  void _submit() {
    final isValid = _formkey.currentState?.validate() ?? false;
    if (!isValid) return;
    if (_formData.image == null && _formData.isSingup) {
      return _showError("Imagem não selecionada");
    }
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                if (_formData.isSingup)
                  UserImagePicker(onImagePick: _handleImagePick),
                if (_formData.isSingup)
                  TextFormField(
                    key: const ValueKey("name"),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    // ignore: body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.trim().length < 5) {
                        return 'Nome deve ter no minímo 5 caractere';
                      }
                    },
                  ),
                TextFormField(
                  // ignore: prefer_const_constructors
                  key: ValueKey("email"),
                  initialValue: _formData.email,
                  onChanged: (email) => _formData.email = email,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'E-mail'),
                  // ignore: body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers
                  validator: (_email) {
                    final email = _email ?? '';
                    if (!email.contains('@')) {
                      return 'Email informado não é válido';
                    }
                  },
                ),
                TextFormField(
                  key: const ValueKey("password"),
                  initialValue: _formData.password,
                  onChanged: (password) => _formData.password = password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  // ignore: body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.length < 6) {
                      return 'Senha deve ter no mínimo 6 caracteres';
                    }
                  },
                ),
                const SizedBox(
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
