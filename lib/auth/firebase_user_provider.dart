import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HayatFirebaseUser {
  HayatFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

HayatFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HayatFirebaseUser> hayatFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HayatFirebaseUser>(
      (user) {
        currentUser = HayatFirebaseUser(user);
        return currentUser!;
      },
    );
