import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC0H474D6R1jKHE6w-Llv1KnqYKuqn160o",
            authDomain: "zenbil-app.firebaseapp.com",
            projectId: "zenbil-app",
            storageBucket: "zenbil-app.appspot.com",
            messagingSenderId: "1082335730266",
            appId: "1:1082335730266:web:0ea361a8a380f2ad105663",
            measurementId: "G-9LKC2HRFTD"));
  } else {
    await Firebase.initializeApp();
  }
}
