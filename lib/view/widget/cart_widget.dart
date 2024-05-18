import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin/controller/cart_controller.dart';

import '../../core/color.dart';
import '../../core/dialog.dart';

class ButtonCancelInCart extends StatelessWidget {
  const ButtonCancelInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Expanded(
            child: ElevatedButton(
              onPressed: () {
                controller.deleteAllCart().then((value) {
                  successDialog(
                          context: context,
                          desc: 'All products have been removed from the cart',
                          btnOkOnPress: () {})
                      .show();
                });
              },
              child: Text(
                'Cancel',
              ),
              style: ElevatedButton.styleFrom(
                primary: ProjectColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          );
        });
  }
}

class ButtonOkInCart extends StatelessWidget {
  const ButtonOkInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartController>(
        init: CartController(),

        builder: (controller) {
          return ElevatedButton(
            child: Text('buying', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: ProjectColors.accentColor,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              controller.deleteAllCart().then((value) {
                successDialog(
                    context: context,
                    desc: 'All products have been removed from the cart',
                    btnOkOnPress: () {})
                    .show();
              });
            },
          );
        }
      ),
    );
  }
}

class CardItemInCart extends StatefulWidget {
  final int index;
  final snapshot;

  const CardItemInCart({
    super.key,
    required this.index,
    required this.snapshot,
  });

  @override
  State<CardItemInCart> createState() => _CardItemInCartState();
}

class _CardItemInCartState extends State<CardItemInCart> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    var data = widget.snapshot.data!.docs[widget.index].data();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: ProjectColors.mainColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    data['image'],
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data['title'],
                            maxLines: 1,
                            style: TextStyle(
                                color: ProjectColors.accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                if (number > 1) {
                                  number--;
                                }
                                setState(() {});
                              },
                              child: CircleAvatar(
                                  child: Icon(Icons.minimize_sharp),
                                  radius: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              number.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                number++;
                                setState(() {});
                              },
                              child: CircleAvatar(
                                  child: Icon(Icons.add), radius: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      data['desc'],
                      maxLines: 1,
                      style: TextStyle(color: ProjectColors.accentColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data['price']} \$',
                          style: TextStyle(
                              color: ProjectColors.accentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${int.tryParse(data['price'])! * number} \$',
                          style: TextStyle(
                              color: ProjectColors.accentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
