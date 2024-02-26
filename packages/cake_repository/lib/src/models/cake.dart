import '../entities/cake_entity.dart';
import 'macros.dart';

class Cake {
  String cakeId;
  String picture;
  bool isVeg;
  int eggless;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Cake({
    required this.cakeId,
    required this.picture,
    required this.isVeg,
    required this.eggless,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  CakeEntity toEntity() {
    return CakeEntity(
      cakeId: cakeId,
      picture: picture,
      isVeg: isVeg,
      eggless: eggless,
      name: name,
      description: description,
      price: price,
      discount: discount,
      macros: macros,
    );
  }

  static Cake fromEntity(CakeEntity entity) {
    return Cake(
      cakeId: entity.cakeId,
      picture: entity.picture,
      isVeg: entity.isVeg,
      eggless: entity.eggless,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      macros: entity.macros,
    );
  }
}
