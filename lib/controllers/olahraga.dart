import 'package:cloud_firestore/cloud_firestore.dart';

class Olahraga {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> allData() async {
    CollectionReference sports = fireStore.collection('olahraga');
    sports.get();
  }
}
