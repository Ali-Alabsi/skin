
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../view/screen/cart.dart';
import '../view/screen/home.dart';
import '../view/screen/products.dart';
import '../view/screen/profile.dart';



class LayoutController extends GetxController{
  int currentIndex = 0;
  List Screen =[
    Home(),
    Products(),
    Cart(),
    Profile(),
  ];

  List<String> nameScreen=[
    "Home",
    "Products",
    "Favorites",
    "Profile",
  ];
  changeCurrentIndex(int i){
    currentIndex = i;
    update();
  }

  Future exitLogin() async {
    await FirebaseAuth.instance.signOut();
    Get.offNamed('/login');
  }

}