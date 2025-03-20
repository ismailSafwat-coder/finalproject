import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservices {
  // Get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get current user
  User? getcurrentuser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in
  Future<String> signin({
    required String email,
    required String password,
    required BuildContext context, // Added context for showing dialogs
  }) async {
    String res = 'Some errors occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'succeed';
      } else {
        res = 'Please fill in all the fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showErrorDialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showErrorDialog(context, 'Wrong password provided for that user.');
      } else {
        _showErrorDialog(context, e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      res = e.toString();
      _showErrorDialog(context, res);
    }
    return res;
  }

  // Sign in with Google
  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      // Start the Google sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // Handle error with Firebase authentication
      _showErrorDialog(
          context, e.message ?? 'An error occurred during Google Sign-In.');
    } catch (e) {
      _showErrorDialog(context, e.toString());
      print(e.toString());
    }
  }

  // Sign up
  Future<String> signup(
      String email, String password, BuildContext context) async {
    String res = 'Some errors occurred';
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = 'succeed';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showErrorDialog(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showErrorDialog(context, 'The account already exists for that email.');
      } else {
        _showErrorDialog(context, e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      _showErrorDialog(context, e.toString());
      res = e.toString();
    }
    return res;
  }

  // Sign out
  Future<void> singout() async {
    return await _firebaseAuth.signOut();
  }

  // Show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
