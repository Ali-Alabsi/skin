import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin/core/color.dart';

import '../../controller/product_controller.dart';
import '../widget/products_widget.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('products');
    return Scaffold(
        body: FutureBuilder(
            future: post.get(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  // margin:  EdgeInsets.symmetric(vertical: 20 , horizontal: 15),
                  child: GridView.builder(
                    itemCount:  snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: .55,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return CardProducts(index: index,snapshot: snapshot,);
                    },
                  ),
                );
              }
              return Center(child: CircleAvatar(child: Text('Loading...' ,style: TextStyle(color: Colors.white)), radius:40,));
            }));
  }
}
