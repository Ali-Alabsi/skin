import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../core/color.dart';

class CardProducts extends StatelessWidget {
  final snapshot;
  final int index;
  const CardProducts({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {
   var data= snapshot.data!.docs[index].data();
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: ProjectColors.mainColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                boxShadow: [
                  BoxShadow(
                      color: ProjectColors.mainColor.withOpacity(0.3),
                      offset: Offset.zero,
                      blurRadius: 3,
                      spreadRadius: 3)
                ]),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              data['image'],
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data['title'],
            maxLines: 2,
            style: TextStyle(
                fontSize: 18,

                color:ProjectColors.accentColor,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  data['desc'],
                  maxLines: 1,
                  style: TextStyle(color: ProjectColors.accentColor,fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    data['elv'],
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${data['price']}\$',
                style: TextStyle(
                    color: ProjectColors.accentColor, fontSize: 22 , fontWeight: FontWeight.bold),
              ),
              GetBuilder<ProductController>(
                init: ProductController(),
                builder: (controller) {
                  return InkWell(
                    onTap: (){
                      controller.addToCart(
                        data['title'],
                        data['desc'],
                        data['price'],
                        data['image'],
                        context
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      decoration: BoxDecoration(
                          color: ProjectColors.accentColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                offset: Offset.zero,
                                spreadRadius: 2,
                                blurRadius: 3)
                          ]),
                    ),
                  );
                }
              )
            ],
          ),

        ],
      ),
    );
  }
}