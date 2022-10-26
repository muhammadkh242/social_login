import 'package:flutter/material.dart';
import 'package:sociallogin/consants.dart';
import 'package:twitter_login/twitter_login.dart';

import '../model/user.dart';
import '../user_info/user_info_screen.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  User? user;
  bool loggingIn = true;

  @override
  void initState() {
    _signInWithTwitter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loggingIn
        ? const Scaffold()
        : user == null
            ? const Scaffold()
            : UserInfoScreen(user: user!);
  }

  _signInWithTwitter() async {
    final twitterLogin = TwitterLogin(
      apiKey: apiKey,
      apiSecretKey: apiSecret,
      redirectURI: twitterRedirectUrl,
    );
    final loginResult = await twitterLogin.login();
    if (loginResult.status == TwitterLoginStatus.loggedIn) {
      user = User(
        name: loginResult.user?.name,
        email: loginResult.user?.screenName,
        avatarUrl: loginResult.user?.thumbnailImage,
        socialPlatform: SocialPlatform.twitter,
      );
      setState(() {
        loggingIn = false;
      });
    }
  }
}
