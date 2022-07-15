import 'package:brew_crew/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //collectionreference
  CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

// get all documents (list of brew data)
  //Custom Data
  //Stream data
  Stream<List<BrewModel>> get brewStream {
    return brewCollection.snapshots().map(customBrew);
  }

  List<BrewModel> customBrew(QuerySnapshot snapshot) {
    return snapshot.docs.map((each) {
      return BrewModel(
          name: each.get('name') ?? '',
          barista: each.get('barista') ?? false,
          brew: each.get('brew') ?? '');
    }).toList();
  }

//---------------------------------------
//get brew data by uid

  //get user doc stream
  Stream<BrewModel> get userDocStream {
    return brewCollection.doc(uid).snapshots().map(_customUserBrew);
  }

  //Custom user data
  BrewModel _customUserBrew(DocumentSnapshot snapshot) {
    return BrewModel(
        name: snapshot.get("name") ?? "New Member",
        barista: snapshot.get("barista") ?? false,
        brew: snapshot.get("brew") ?? "");
  }

//---------------------------------------

  Future updateUserData(String name, bool barista, String brew) async {
    try {
      return await brewCollection.doc(uid).set({
        'name': name,
        'barista': barista,
        'brew': brew,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //For barista
  Future updateCoffee(String name, int price) async {
    return await brewCollection.doc("menu").set({
      'name': name,
      'price': price,
    });
  }
}
