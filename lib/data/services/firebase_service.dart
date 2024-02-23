import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<UserCredential>? signUpUser(String email, String password) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future<UserCredential>? logInUser(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
