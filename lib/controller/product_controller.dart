import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../core/dialog.dart';

class ProductController extends GetxController{
  Future addToCart(title, desc ,price , image , context)async{
    CollectionReference users = FirebaseFirestore.instance.collection('cart');
    users.add({
      'title': title, // John Doe
      'desc': desc, // Stokes and Sons
      'price': price ,// 42
      'image': image ,// 42
    }).then((value) => successDialog(context: context, desc:'Added to cart successfully' ,btnOkOnPress:(){}).show())
        .catchError((error) => print("Failed: $error"));

  }
}