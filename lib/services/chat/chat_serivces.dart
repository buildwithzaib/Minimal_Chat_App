import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user sttream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("User").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // each individual user data
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  // send a message

  // get messages
}
