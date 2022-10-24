import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sociallogin/service/google_api.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GoogleSignInApi().logout().then((value) {
                  print("logout");
                  print(value);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signIn,
          child: const Text("sign in with gmail"),
        ),
      ),
    );
  }

  signIn() {
    GoogleSignInApi().login().then((value) {
      print('response');
      print(value?.email);
    });
  }
}
