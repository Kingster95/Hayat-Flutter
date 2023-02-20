import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AplicatieFirebaseUser {
  AplicatieFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AplicatieFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AplicatieFirebaseUser> aplicatieFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AplicatieFirebaseUser>(
      (user) {
        currentUser = AplicatieFirebaseUser(user);
        return currentUser!;
      },
    );
