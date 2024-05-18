import 'package:flutter/material.dart';

import '../../core/color.dart';

class CardItemForPost extends StatelessWidget {
  final snapshot;
  final int index;
  const CardItemForPost({
    super.key,required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ProjectColors.mainColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(snapshot.data!.docs[index].data()['image'],  fit: BoxFit.cover,)),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.docs[index].data()['title'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      snapshot.data!.docs[index].data()['desc'],
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}