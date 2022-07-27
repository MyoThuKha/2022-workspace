import 'package:brew_crew/Models/brew_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collectionreference
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

// get all documents (list of brew data)
  //Custom Data
  List<BrewModel> customBrew(QuerySnapshot snapshot) {
    return snapshot.docs.map((each) {
      return BrewModel(
        name: each.get('name') ?? '',
        barista: each.get('barista') ?? false,
        brew: each.get('brew') ?? '',
        size: each.get('size') ?? 0,
        cost: each.get('price') ?? [],
      );
    }).toList();
  }

  //Stream data
  Stream<List<BrewModel>> get brewStream {
    return brewCollection.snapshots().map(customBrew);
  }

//---------------------------------------
//get brew data by uid

  //get user doc stream
  Stream<BrewModel> get brewStreamByUid {
    return brewCollection.doc(uid).snapshots().map(_customUserBrew);
  }

  //Custom user data
  BrewModel _customUserBrew(DocumentSnapshot snapshot) {
    return BrewModel(
      name: snapshot.get("name") ?? "New Member",
      barista: snapshot.get("barista") ?? false,
      brew: snapshot.get("brew") ?? "",
      size: snapshot.get("size") ?? 0,
      cost: snapshot.get('price') ?? [],
    );
  }

//---------------------------------------

  Future updateUserData(
      String name, bool barista, String brew, int size, List cost) async {
    try {
      return await brewCollection.doc(uid).set({
        'name': name,
        'barista': barista,
        'brew': brew,
        'size': size,
        'cost': cost,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
