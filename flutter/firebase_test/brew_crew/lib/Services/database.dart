import 'package:brew_crew/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collectionreference
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  //Custom Data
  List<BrewModel> customBrew(QuerySnapshot snapshot) {
    return snapshot.docs.map((each) {
      return BrewModel(
          name: each.get('name') ?? '', brew: each.get('brew') ?? '');
    }).toList();
  }

  //Stream data
  Stream<List<BrewModel>> get brewStream {
    return brewCollection.snapshots().map(customBrew);
  }

  Future updateUserData(String name, String brew) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'brew': brew,
    });
  }

  Future updateCoffee(String name, int price) async {
    return await brewCollection.doc("brew menu").set({
      'name': name,
      'price': price,
    });
  }
}
