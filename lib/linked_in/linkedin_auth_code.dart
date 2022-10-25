import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

const String redirectUrl = 'https://www.google.com/';
const String clientId = '77owj50jx2ltl3';
const String clientSecret = 'fnQaBDaGqSDF2xPy';

class LinkedinCode extends StatelessWidget {
  const LinkedinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkedInAuthCodeWidget(
      onGetAuthCode: (AuthorizationSucceededAction response) {
        print('Auth code ${response.codeResponse.code}');

        print('State: ${response.codeResponse.state}');
      },
      redirectUrl: redirectUrl,
      clientId: clientId,
      onError: (AuthorizationFailedAction failedAction) {
        print("onError");
        print(failedAction.toString());
      },
    );
  }
}
