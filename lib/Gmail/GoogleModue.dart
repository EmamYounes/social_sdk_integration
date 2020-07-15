import 'package:google_sign_in/google_sign_in.dart';

class GoogleModule {
  static GoogleSignIn googleSingIn =
      GoogleSignIn();

  static Future<GoogleSignInAccount> signInWithGmail() async {
    return  googleSingIn.signIn();
  }
  static Future<GoogleSignInAccount> signOutFromGmail() async {
    return await googleSingIn.disconnect();
  }
  static Future<GoogleSignInAccount> signInSilently() async {
    return await googleSingIn.signInSilently();
  }
  static Future<bool> isSignedIn() async {
    return await googleSingIn.isSignedIn();
  }
  static  getSignInOptions() async {
    return await googleSingIn.signInOption;

  }




}
