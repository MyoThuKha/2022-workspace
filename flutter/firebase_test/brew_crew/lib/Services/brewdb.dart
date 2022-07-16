import 'package:cloud_firestore/cloud_firestore.dart';

class brewdatabase {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("menu");

  //For barista
  Future updateCoffee(String name, double price, String about) async {
    try {
      return await brewCollection.doc("menu").set({
        'name': name,
        'price': price,
        'about': about,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
