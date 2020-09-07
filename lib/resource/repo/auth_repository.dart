import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth;
  const AuthRepository({this.auth});

  Future<UserCredential> login({String email, password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> register({String email, password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
