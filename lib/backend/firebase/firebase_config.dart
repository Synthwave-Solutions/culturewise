import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCzVB7BISeJkJ23f8OjmofG7DEHQ27IpDU",
            authDomain: "culture-wise-ldnp9w.firebaseapp.com",
            projectId: "culture-wise-ldnp9w",
            storageBucket: "culture-wise-ldnp9w.appspot.com",
            messagingSenderId: "697637097687",
            appId: "1:697637097687:web:aa6f58ca62eb5a1abf2092"));
  } else {
    await Firebase.initializeApp();
  }
}
