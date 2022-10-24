import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../service/google_api.dart';
import 'auth.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);
  final GoogleSignInAccount user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignInApi().logout();
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => AuthScreen()));
              },
              icon: const Icon(Icons.logout))
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
