import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sociallogin/consants.dart';
import 'package:sociallogin/face_book/facebook_login.dart';
import 'package:sociallogin/google/google_login.dart';
import 'package:sociallogin/instagram/instagram_login.dart';
import 'package:sociallogin/linked_in/linkedin_auth_code.dart';
import 'package:sociallogin/twitter/twitter_login.dart';
import 'package:sociallogin/user_info/user_info_screen.dart';
import 'package:sociallogin/linked_in/linked_in_login.dart';
import 'package:sociallogin/model/user.dart';
import 'package:sociallogin/widgets/signin_button.dart';
import 'package:twitter_login/twitter_login.dart';
import 'google/google_api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Image.asset(
                "assets/images/authentication.png",
                scale: 2.4,
              ),
              const SizedBox(
                height: 40,
              ),
              SignInButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const GoogleScreen()));
                  },
                  assetPathName: 'Google'),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const FaceBookScreen()));
                  },
                  assetPathName: 'Facebook'),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LinkedInScreen()));
                  },
                  assetPathName: 'Linkedin'),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const TwitterScreen()));
                  },
                  assetPathName: 'Twitter'),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const InstagramScreen()));
                  },
                  assetPathName: 'Instagram'),
            ],
          ),
        ),
      ),
    );
  }
}
