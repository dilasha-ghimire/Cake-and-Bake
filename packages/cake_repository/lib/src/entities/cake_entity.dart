import 'package:cake_repository/src/entities/macros_entity.dart';
import 'package:cake_repository/src/models/models.dart';

class CakeEntity {
  String cakeId;
  String picture;
  bool isVeg;
  int eggless;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  CakeEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'cakeId': cakeId,
      'picture': picture,
      'isVeg': isVeg,
      'eggless': eggless,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static CakeEntity fromDocument(Map<String, dynamic> doc) {
    return CakeEntity(
      cakeId: doc['cakeId'],
      picture: doc['picture'],
      isVeg: doc['isVeg'],
      eggless: doc['eggless'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}
