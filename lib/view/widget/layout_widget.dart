import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../controller/loyout_controller.dart';
import '../../core/color.dart';

class bottomNavigationBarCode extends StatelessWidget {
  const bottomNavigationBarCode({
    super.key,
    required this.obGet,
  });

  final LayoutController obGet;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GetBuilder<LayoutController>(
                builder:(controller)=> GNav(
                    onTabChange: (i) {
                      obGet.changeCurrentIndex(i);
                      // setState(() {

                      // });
                    },
                    selectedIndex: controller.currentIndex,
                    rippleColor: Colors.grey,
                    hoverColor: Colors.grey,
                    haptic: true,
                    tabBorderRadius: 15,
                    // tabActiveBorder: Border.all(color: Colors.black, width: 1),
                    // tabBorder: Border.all(color: Colors.grey, width: 1),
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 900),
                    gap: 8,
                    color: Colors.black87,
                    activeColor: Colors.white,
                    iconSize: 24,
                    tabBackgroundColor: ProjectColors.mainColor,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.card_travel,
                        text: 'Products',
                      ),
                      GButton(
                        icon: Icons.shopping_cart_rounded,
                        text: 'Cart',
                      ),
                      GButton(
                        icon: Icons.account_circle,
                        text: 'Profile',
                      ),
                    ]),
              ),
            )));
  }
}