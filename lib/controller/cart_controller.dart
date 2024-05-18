import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  Future<void> deleteAllCart() async {
    QuerySnapshot querySnapshot = await cart.get();
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  }

}