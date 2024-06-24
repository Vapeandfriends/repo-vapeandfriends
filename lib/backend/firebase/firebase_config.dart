import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDdC-DK51bowisVzfEeFA74msHiEH6q89Y",
            authDomain: "vapeandfriends-af9ea.firebaseapp.com",
            projectId: "vapeandfriends-af9ea",
            storageBucket: "vapeandfriends-af9ea.appspot.com",
            messagingSenderId: "857999967851",
            appId: "1:857999967851:web:0701f8844e6f8c776d532e",
            measurementId: "G-0HDMV234LQ"));
  } else {
    await Firebase.initializeApp();
  }
}
