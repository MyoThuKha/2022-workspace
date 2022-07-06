import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Screens/Pages/brew_list.dart';
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
          name: each.get('name') ?? '',
          strength: each.get('strength') ?? 0,
          sugars: each.get('sugars') ?? '0');
    }).toList();
  }

  //Stream data
  Stream<List<BrewModel>> get brewStream {
    return brewCollection.snapshots().map(customBrew);
  }

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
