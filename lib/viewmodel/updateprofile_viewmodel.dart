import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateProfileViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      final User? user = _firebaseAuth.currentUser;
      final userSnapshot = await _firestore.collection('users').doc(user?.uid).get();
      final userData = userSnapshot.data() as Map<String, dynamic>?;

      return userData ?? {};
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  Future<void> updateProfile(Map<String, dynamic> updatedUserDetails) async {
    try {
      final User? user = _firebaseAuth.currentUser;
      await _firestore.collection('users').doc(user?.uid).update(updatedUserDetails);
    } catch (e) {
      print('Error: $e');
      throw 'An error occurred while updating the profile.';
    }
  }
}