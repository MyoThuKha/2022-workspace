import 'package:firebase_auth/firebase_auth.dart';

class BrewModel {
  final String name;
  final String brew;
  BrewModel({required this.name, required this.brew});
}

class UserModelSet extends BrewModel {
  final String uid;
  UserModelSet({required name, required brew, required this.uid})
      : super(name: name, brew: brew);
}
