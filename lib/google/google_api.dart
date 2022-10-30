import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  late GoogleSignIn _googleSignIn;

  static final GoogleSignInApi _googleSignInApi = GoogleSignInApi.internal();

  GoogleSignInApi.internal() {
    _googleSignIn = GoogleSignIn();
  }

  factory GoogleSignInApi() => _googleSignInApi;

  Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();
}
