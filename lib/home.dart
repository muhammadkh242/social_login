import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sociallogin/face_book/fb_login_screen.dart';
import 'package:sociallogin/google/google_user_info.dart';
import 'package:sociallogin/linked_in/linked_in_login.dart';
import 'package:sociallogin/service/google_api.dart';

import 'face_book/face_book_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignInApi().logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final user = await GoogleSignInApi().login();
                if (user != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => GoogleUserInfoScreen(user: user)));
                }
              },
              child: const Text("sign in with gmail"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const FBScreen()));
              },
              child: const Text("sign in with FB"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final plugin = FacebookLogin(debug: true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const LinkedInScreen()));
              },
              child: const Text("sign in with Linkedin"),
            )
          ],
        ),
      ),
    );
  }
}
