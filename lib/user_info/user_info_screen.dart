import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sociallogin/google/google_api.dart';
import 'package:sociallogin/home.dart';
import 'package:sociallogin/model/user.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  static const String routeName = "GoogleUserInfoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _logout();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: user.avatarUrl != null
                    ? NetworkImage(user.avatarUrl!)
                    : const AssetImage("assets/images/user.png")
                        as ImageProvider,
              ),
              const SizedBox(
                height: 40,
              ),
              TextContainer(text: user.name ?? ""),
              const SizedBox(
                height: 40,
              ),
              TextContainer(text: user.email ?? ""),
            ],
          ),
        ),
      ),
    );
  }

  _logout() async {
    switch (user.socialPlatform) {
      case SocialPlatform.google:
        GoogleSignInApi().logout();
        break;
      case SocialPlatform.facebook:
        await FacebookAuth.instance.logOut();
        break;
      case SocialPlatform.linkedin:
        break;
    }
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)));
  }
}
