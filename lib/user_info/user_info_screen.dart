import 'package:flutter/material.dart';
import 'package:sociallogin/model/user.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(user.email, style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
