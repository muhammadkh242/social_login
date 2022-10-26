import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sociallogin/consants.dart';
import 'package:sociallogin/user_info/user_info_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/user.dart';

class InstagramScreen extends StatefulWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  bool loading = false;
  User? user;

  @override
  Widget build(BuildContext context) {
    return !loading
        ? user == null
            ? WebView(
                initialUrl: instagramLoginUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                  if (url != instagramLoginUrl) {
                    //get code
                    Uri uri = Uri.parse(url);
                    final code = uri.queryParameters['code'];
                    if (code != null) {
                      _getUserToken(code);
                    }
                    //post

                  }
                },
                gestureNavigationEnabled: true,
              )
            : UserInfoScreen(user: user!)
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  _getUserToken(String code) async {
    setState(() {
      loading = true;
    });
    final http.Response response =
        await http.post(Uri.parse(instagramGetTokenUrl), body: {
      "client_id": instaAppId,
      "redirect_uri": instagramRedirectUrl,
      "client_secret": instaAppSecret,
      "code": code,
      "grant_type": "authorization_code"
    });

    print("RESPONSE");
    print(response.body);
    final token = json.decode(response.body)['access_token'];
    final id = json.decode(response.body)['user_id'];
    _getUserNode(token, id.toString());
  }

  _getUserNode(String token, String id) async {
    final http.Response response = await http.get(Uri.parse(
        "https://graph.instagram.com/$id?fields=id,username&access_token=$token"));
    print("Response node");
    print(response.body);
    final userData = json.decode(response.body);
    if (userData['id'] != null) {
      user = User(
        name: userData['username'],
        email: null,
        avatarUrl: null,
        socialPlatform: SocialPlatform.instagram,
      );
      setState(() {
        loading = false;
      });
    }
  }
}
