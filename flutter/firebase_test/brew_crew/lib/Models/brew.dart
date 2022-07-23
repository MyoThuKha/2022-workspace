class BrewModel {
  final String name;
  final bool barista;
  final String brew;
  final String size;
  BrewModel(
      {required this.name,
      required this.barista,
      required this.brew,
      required this.size});
}

class UserModelSet extends BrewModel {
  final String uid;
  UserModelSet(
      {required name,
      required barista,
      required brew,
      required size,
      required this.uid})
      : super(name: name, barista: barista, brew: brew, size: size);
}
