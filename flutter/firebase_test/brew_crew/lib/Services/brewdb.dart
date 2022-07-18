import 'package:brew_crew/Models/menu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Brewdatabase {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("menu");

  List<MenuModel> customMenuModel(QuerySnapshot snapshot) {
    return snapshot.docs.map((eachDocument) {
      // print(eachDocument);
      return MenuModel(
          name: eachDocument.toString(),
          price: eachDocument['price'],
          about: eachDocument['about']);
    }).toList();
  }

  Stream<List<MenuModel>> get menuStream {
    return brewCollection.snapshots().map(customMenuModel);
  }

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
