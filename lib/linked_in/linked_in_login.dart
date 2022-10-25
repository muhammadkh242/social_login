import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

const String redirectUrl = 'https://www.google.com/';
const String clientId = '77owj50jx2ltl3';
const String clientSecret = 'fnQaBDaGqSDF2xPy';

class LinkedInScreen extends StatelessWidget {
  const LinkedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      appBar: AppBar(
        title: const Text('Linked In Login'),
      ),
      onGetUserProfile: (UserSucceededAction linkedinUser) {
        print("onGetUserProfile");
        print(linkedinUser.user.firstName);
        print(linkedinUser.user.lastName);
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
