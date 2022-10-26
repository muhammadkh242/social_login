import 'package:flutter/material.dart';

import '../model/user.dart';
import '../user_info/user_info_screen.dart';
import 'google_api.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  User? user;
  bool loggingIn = true;

  @override
  void initState() {
    _signInWithGoogle();
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

  _signInWithGoogle() async {
    final account = await GoogleSignInApi().login();

    if (account != null) {
      user = User(
        name: account.displayName,
        email: account.email,
        avatarUrl: account.photoUrl,
        socialPlatform: SocialPlatform.google,
      );
      setState(() {
        loggingIn = false;
      });
    }
  }
}
