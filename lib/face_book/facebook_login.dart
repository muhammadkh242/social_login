import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sociallogin/user_info/user_info_screen.dart';

import '../model/user.dart';

class FaceBookScreen extends StatefulWidget {
  const FaceBookScreen({Key? key}) : super(key: key);

  @override
  State<FaceBookScreen> createState() => _FaceBookLoginState();
}

class _FaceBookLoginState extends State<FaceBookScreen> {
  User? user;
  bool loggingIn = true;

  @override
  void initState() {
    _login();
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

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      final picture = userData['picture'];
      print("avatar");
      print(picture['data']['url']);
      user = User(
          name: userData['name'],
          email: userData['email'],
          avatarUrl: picture['data']['url'].toString(),
          socialPlatform: SocialPlatform.facebook);
    }
    setState(() {
      loggingIn = false;
    });
  }
}
