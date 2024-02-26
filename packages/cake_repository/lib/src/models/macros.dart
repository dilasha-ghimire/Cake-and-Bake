import '../entities/macros_entity.dart';

class Macros {
  int calories;
  int sugar;
  int fat;
  int carbs;

  Macros({
    required this.calories,
    required this.sugar,
    required this.fat,
    required this.carbs,
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      sugar: sugar,
      fat: fat,
      carbs: carbs,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
        calories: entity.calories,
        sugar: entity.sugar,
        fat: entity.fat,
        carbs: entity.carbs);
  }
}
