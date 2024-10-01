import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

Logger _log = Logger('auth_service.dart');

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password
  Future<UserCredential?> signUp(
      Function(String e) errorCallback,
      String fullName,
      String email,
      String password,
      String phoneNumber) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the current user
      final User? user = _auth.currentUser;

      // Check if user creation was successful
      if (user != null) {
        // Create a reference to the user's document in Firestore
        // final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Create user data map
        final userData = {
          'fullName': fullName,
          'email': email,
          'phoneNumber': phoneNumber,
          // Add any other relevant user data fields here
        };

        // Set the user data in Firestore
        // await docRef.set(userData);

        return credential; // Return the credential for further actions
      } else {
        return null; // Handle user creation failure (shouldn't happen)
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorCallback('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorCallback('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      _log.info(e);
      return null;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signIn(
      Function(String e) errorCallback, String email, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorCallback('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorCallback('Wrong password provided for that user.');
      } else {
        errorCallback(
            "The supplied auth credential is incorrect, malformed or has expired.");
      }
      return null;
    } catch (e) {
      _log.info(e);
      return null;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle(
      Function(String e) errorCallback) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        if (googleAuth != null) {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          final User? user = userCredential.user;

          if (user != null) {
            // Check if the user exists in the Patients collection
            DocumentSnapshot docSnapshot =
                await _firestore.collection('Patients').doc(user.uid).get();

            if (!docSnapshot.exists) {
              // User does not exist, store user details in the Patients collection
              await _firestore.collection('patients').doc(user.uid).set({
                'uid': user.uid,
                'name': user.displayName ?? '',
                'email': user.email ?? '',
                'image': user.photoURL ?? '',
                'phoneNumber': user.phoneNumber ?? '',
                'medicalHistory': '',
                'location': '',
                'age': 0,
                'gender': '',
                'password':
                    'no password for you hacker', 
                'emergencyContacts': [],
                'demographics': {
                  'ethnicity': '',
                  'race': '',
                  'language': '',
                  'maritalStatus': ''
                }
              });
            }
          }

          return userCredential;
        } else {
          _log.info('Error getting Google auth token');
        }
      } else {
        _log.info('Error signing in with Google');
      }
      return null;
    } on PlatformException catch (e) {
      if (e.code == GoogleSignIn.kNetworkError) {
        String errorMessage =
            "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
        errorCallback(errorMessage);
        return null;
      } else {
        String errorMessage = "Something went wrong.";
        errorCallback(errorMessage);
        return null;
      }
    }
  }

  // Sign out the current user
  Future<void> signOut() async {
    _log.info("Signing out...");
    await _auth.signOut();
  }

  // Check if a user is currently signed in
  Stream<User?> get currentUser => _auth.authStateChanges();
}
