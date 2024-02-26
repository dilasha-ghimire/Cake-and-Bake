import 'models/models.dart';

abstract class CakeRepo {
  Future<List<Cake>> getCakes();
  Future<void> saveCake(Cake cake);
  Future<void> deleteCake(String cakeId);
}
