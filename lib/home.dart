import 'package:flutter/material.dart';
import 'package:sociallogin/face_book/facebook_login.dart';
import 'package:sociallogin/google/google_user_info.dart';
import 'package:sociallogin/linked_in/linked_in_login.dart';
import 'package:sociallogin/model/user.dart';
import 'package:sociallogin/widgets/signin_button.dart';
import 'google/google_api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                  _signInWithGoogle(context);
                },
                assetPathName: 'Google'),
            const SizedBox(
              height: 30,
            ),
            SignInButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const FaceBookScreen()));
                },
                assetPathName: 'Facebook'),
            const SizedBox(
              height: 30,
            ),
            SignInButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LinkedInScreen()));
                },
                assetPathName: 'Linkedin'),
          ],
        ),
      ),
    );
  }

  _signInWithGoogle(BuildContext context) async {
    final account = await GoogleSignInApi().login();

    if (account != null) {
      User user = User(
        name: account.displayName,
        email: account.email,
        avatarUrl: account.photoUrl,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => GoogleUserInfoScreen(
                user: user,
              )));
    }
  }
}
