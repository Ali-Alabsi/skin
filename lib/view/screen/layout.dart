import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/loyout_controller.dart';
import '../widget/layout_widget.dart';

class Layout extends StatelessWidget {
  LayoutController obGet = Get.put(LayoutController());
   Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Skin Care' ,style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [
            GetBuilder<LayoutController>(
              init: LayoutController(),
              builder: (controller) {
                return InkWell(
                  onTap: (){
                    controller.exitLogin();
                  },
                  child: Icon(Icons.exit_to_app,color: Colors.black,),
                );
              }
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: GetBuilder<LayoutController>(
          builder: (controller){
            return controller.Screen[controller.currentIndex];
          },
        ),
        bottomNavigationBar: bottomNavigationBarCode(obGet: obGet)
    );
  }
}
