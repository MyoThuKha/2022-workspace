import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collectionreference
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");
}
