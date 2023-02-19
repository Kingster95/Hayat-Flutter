import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAGn9_o366Q31VM5lXBtuYc046_k6cYK4A",
            authDomain: "hayat-371613.firebaseapp.com",
            projectId: "hayat-371613",
            storageBucket: "hayat-371613.appspot.com",
            messagingSenderId: "978480878129",
            appId: "1:978480878129:web:e1cd34fb328fe80000fb10",
            measurementId: "G-3KE48ZHDW6"));
  } else {
    await Firebase.initializeApp();
  }
}
