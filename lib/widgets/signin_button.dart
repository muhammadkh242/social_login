import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {Key? key, required this.onTap, required this.assetPathName})
      : super(key: key);
  final Function() onTap;
  final String assetPathName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                "assets/images/$assetPathName.png",
                scale: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Sign in with $assetPathName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
