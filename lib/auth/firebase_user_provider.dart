import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SmartifyCRMFirebaseUser {
  SmartifyCRMFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SmartifyCRMFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SmartifyCRMFirebaseUser> smartifyCRMFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SmartifyCRMFirebaseUser>(
      (user) {
        currentUser = SmartifyCRMFirebaseUser(user);
        return currentUser!;
      },
    );
