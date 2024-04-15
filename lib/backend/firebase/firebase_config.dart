import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCKV9Fhc6b6dGCsCgucNTZ14D3GCsBdpoQ",
            authDomain: "unified-assist-wra4g4.firebaseapp.com",
            projectId: "unified-assist-wra4g4",
            storageBucket: "unified-assist-wra4g4.appspot.com",
            messagingSenderId: "248219729499",
            appId: "1:248219729499:web:cb5f7354bcd97a1716097e"));
  } else {
    await Firebase.initializeApp();
  }
}
