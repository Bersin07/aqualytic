

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  //Google sign in
  signInWithGoogle() async{
    // begin interactive sign proces
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credentials for the users
    final Credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finallly sign in
    return await FirebaseAuth.instance.signInWithCredential(Credential);
  }
}