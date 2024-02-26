class MacrosEntity {
  int calories;
  int sugar;
  int fat;
  int carbs;

  MacrosEntity({
    required this.calories,
    required this.sugar,
    required this.fat,
    required this.carbs,
  });

  Map<String, Object?> toDocument() {
    return {
      'calories': calories,
      'sugar': sugar,
      'fat': fat,
      'carbs': carbs,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
      calories: doc['calories'],
      sugar: doc['sugar'],
      fat: doc['fat'],
      carbs: doc['carbs'],
    );
  }
}
