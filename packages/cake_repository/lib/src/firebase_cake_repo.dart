import 'dart:developer';
import 'package:cake_repository/cake_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCakeRepo implements CakeRepo {
  final cakeCollection = FirebaseFirestore.instance.collection('cakes');

  @override
  Future<List<Cake>> getCakes() async {
    try {
      return await cakeCollection.get().then((value) => value.docs
          .map((e) => Cake.fromEntity(CakeEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> saveCake(Cake cake) async {
    try {
      await cakeCollection.add(cake.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteCake(String cakeId) async {
    try {
      await cakeCollection.doc(cakeId).delete();
    } catch (e) {
      throw Exception('Failed to delete cake');
    }
  }
}
