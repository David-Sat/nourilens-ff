import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB3nhmYyL-4qO7ssQa9-QzvHzM3JafAAuE",
            authDomain: "nourilens.firebaseapp.com",
            projectId: "nourilens",
            storageBucket: "nourilens.appspot.com",
            messagingSenderId: "509574571249",
            appId: "1:509574571249:web:1c9d3ac09dd58ab2e6b550",
            measurementId: "G-YN3JLVW5N3"));
  } else {
    await Firebase.initializeApp();
  }
}
