import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skin/core/color.dart';

import '../widget/home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('post');
    return Scaffold(
      body: FutureBuilder(
        future: post.get(),
        builder:  (BuildContext context,  snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CardItemForPost(
                      snapshot: snapshot,
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: snapshot.data!.docs.length),
            );
          }

          return Center(child: CircleAvatar(child: Text('Loading...' ,style: TextStyle(color: Colors.white)), radius:40,));
        }
      ),
    );
  }
}


