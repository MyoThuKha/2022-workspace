import 'package:brew_crew/Models/menu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BrewdatabaseService {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("menu");

  List<MenuModel> customMenuModel(QuerySnapshot snapshot) {
    return snapshot.docs.map((each) {
      // print(eachDocument);
      return MenuModel(
          // name: each.id,
          //for name change
          name: each['name'] ?? "",
          price: each['price'] ?? 0.0,
          about: each['about'] ?? "");
    }).toList();
  }

  Stream<List<MenuModel>> get menuStream {
    return brewCollection.snapshots().map(customMenuModel);
  }

  //For barista
  Future updateCoffee(String name, double price, String about) async {
    try {
      return await brewCollection.doc(name).set({
        'name': name,
        'price': price,
        'about': about,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
