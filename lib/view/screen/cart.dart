import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skin/core/color.dart';

import '../widget/cart_widget.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('cart');
    return Scaffold(
      body: FutureBuilder(
          future: post.get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardItemInCart(snapshot: snapshot, index: index,);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                  itemCount:  snapshot.data!.docs.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                child: Row(
                  children: [
                    ButtonCancelInCart(),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonOkInCart(),
                  ],
                ),
              )
            ],
          );}
          return Center(child: CircleAvatar(child: Text('Loading...' ,style: TextStyle(color: Colors.white)), radius:40,));
        }
      ),
    );
  }
}


