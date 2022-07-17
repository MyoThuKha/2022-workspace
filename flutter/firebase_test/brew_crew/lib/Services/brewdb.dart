import 'package:cloud_firestore/cloud_firestore.dart';

class Brewdatabase {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("menu");

  //For barista
  Future updateCoffee(String name, double price, String about) async {
    try {
      return await brewCollection.doc(name).set({
        'price': price,
        'about': about,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
