class BrewModel {
  final String name;
  final bool barista;
  final String brew;
  BrewModel({required this.name, required this.barista, required this.brew});
}

class UserModelSet extends BrewModel {
  final String uid;
  UserModelSet(
      {required name, required barista, required brew, required this.uid})
      : super(name: name, barista: barista, brew: brew);
}
