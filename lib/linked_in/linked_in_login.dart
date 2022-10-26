import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:sociallogin/user_info/user_info_screen.dart';
import '../model/user.dart';

const String redirectUrl = 'https://www.google.com/';
const String clientId = '77owj50jx2ltl3';
const String clientSecret = 'fnQaBDaGqSDF2xPy';

class LinkedInScreen extends StatelessWidget {
  LinkedInScreen({Key? key}) : super(key: key);
  bool logout = false;

  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout = true;
              },
              icon: Icon(Icons.logout))
        ],
        title: const Text('Linked In Login'),
      ),
      destroySession: logout,
      onGetUserProfile: (UserSucceededAction linkedinUser) {
        User user = User(
          name:
              "${linkedinUser.user.localizedFirstName!} ${linkedinUser.user.localizedLastName}",
          email: linkedinUser.user.email!.elements![0].handleDeep?.emailAddress,
          avatarUrl: linkedinUser.user.profilePicture?.displayImageContent
              ?.elements![0].identifiers![0].identifier,
          socialPlatform: SocialPlatform.linkedin,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => UserInfoScreen(user: user)));
      },
      onError: (UserFailedAction failedAction) {
        print("onError");
        print(failedAction.toString());
      },
      redirectUrl: redirectUrl,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }
}
