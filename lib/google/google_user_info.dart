import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sociallogin/google/google_api.dart';

class GoogleUserInfoScreen extends StatelessWidget {
  const GoogleUserInfoScreen({Key? key, required this.user}) : super(key: key);
  final GoogleSignInAccount user;

  static const String routeName = "GoogleUserInfoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GoogleSignInApi().logout();
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
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(user.displayName!),
              const SizedBox(
                height: 10,
              ),
              Text(user.email),
            ],
          ),
        ),
      ),
    );
  }
}
