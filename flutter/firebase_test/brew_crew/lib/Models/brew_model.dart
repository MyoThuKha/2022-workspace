class BrewModel {
  final String name;
  final bool barista;
  final String brew;
  final int size;
  final List cost;
  final List favorite;
  BrewModel({
    required this.name,
    required this.barista,
    required this.brew,
    required this.size,
    required this.cost,
    required this.favorite,
  });
}

class UserModelSet extends BrewModel {
  final String uid;
  UserModelSet(
      {required name,
      required barista,
      required brew,
      required size,
      required price,
      required favorite,
      required this.uid})
      : super(
            name: name,
            barista: barista,
            brew: brew,
            size: size,
            cost: price,
            favorite: favorite);
}