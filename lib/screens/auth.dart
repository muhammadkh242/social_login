import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sociallogin/screens/user_info.dart';
import 'package:sociallogin/service/google_api.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async{
                await GoogleSignInApi().logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signIn(context);
          },
          child: const Text("sign in with gmail"),
        ),
      ),
    );
  }

  signIn(BuildContext context) async {
    final user = await GoogleSignInApi().login();
    if (user != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => UserInfoScreen(user: user)));
    }
  }
}
