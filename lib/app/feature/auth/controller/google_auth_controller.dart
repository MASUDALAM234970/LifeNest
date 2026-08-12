import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _initialized = false;

  Future<void> _initializeGoogleSignIn() async {
    if (_initialized) return;

    await _googleSignIn.initialize();

    _initialized = true;
  }

  /// Google Login → Firebase Login → Firebase ID Token
  Future<String?> signInWithGoogle() async {
    try {
      // 1. Initialize Google Sign-In
      await _initializeGoogleSignIn();

      // 2. Google authentication
      final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

      // 3. Get Google authentication data
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // 4. Create Firebase credential
      final AuthCredential credential =
      GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // 5. Login to Firebase
      final UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);

      // 6. Get Firebase user
      final User? user = userCredential.user;

      if (user == null) {
        throw Exception('Firebase user not found');
      }

      // 7. Get Firebase ID Token
      final String? firebaseIdToken =
      await user.getIdToken();

      print('================================');
      print('Google Login Successful');
      print('Firebase UID: ${user.uid}');
      print('Email: ${user.email}');
      print('Name: ${user.displayName}');
      print('Firebase ID Token:');
      print(firebaseIdToken);
      print('================================');

      return firebaseIdToken;
    } catch (e) {
      print('Google Login Error: $e');
      rethrow;
    }
  }

  /// Logout
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}