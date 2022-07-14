import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<FirebaseApp> initFirebaseServices() async {
    return Firebase.initializeApp();
  }
}
