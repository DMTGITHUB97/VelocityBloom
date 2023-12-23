
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:velocitybloom/utils/modals/user_modal.dart';

class APIs {

  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // to return current user
  static User get user => auth.currentUser!;

  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final chatUser = UserModal(
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hey, I'm using We Chat!",
        image: user.photoURL.toString(),
        isActive: false,
        lastSeen: time);

    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}