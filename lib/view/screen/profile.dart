import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/loyout_controller.dart';
import '../../controller/profile_controlller.dart';
import '../../core/color.dart';

class Profile extends StatelessWidget {
  ProfileController contextGetX = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.all(20),
            child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (context) => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: ProjectColors.accentColor.withOpacity(0.3),
                            offset: Offset.zero,
                            blurRadius: 2,
                            spreadRadius: 2)
                      ]),
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 160,
                  )),
            ),
          ),
          GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller) {
                return FutureBuilder(
                    future: controller.user
                        .where('is',
                            isEqualTo:
                                '${FirebaseAuth.instance.currentUser!.uid}')
                        .get(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text("Something went wrong"));
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return nameProfile(
                          snapshot: snapshot,
                        );
                      }
                      return Text('Loading');
                    });
              }),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.all(30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset.zero,
                        blurRadius: 3,
                        spreadRadius: 2)
                  ]),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_box,
                            color: ProjectColors.accentColor,
                            size: 50,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "About US",
                            style: TextStyle(
                                fontSize: 22,
                                color:
                                    ProjectColors.accentColor.withOpacity(0.8),
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        textDirection: TextDirection.rtl,
                        color: ProjectColors.accentColor,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                    color: Colors.grey.withOpacity(0.3),
                    height: 3,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.help,
                            color: ProjectColors.accentColor,
                            size: 50,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Help",
                            style: TextStyle(
                                fontSize: 22,
                                color:
                                    ProjectColors.accentColor.withOpacity(0.8),
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        textDirection: TextDirection.rtl,
                        color: ProjectColors.accentColor,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                    color: Colors.grey.withOpacity(0.3),
                    height: 3,
                  ),
                  GetBuilder<LayoutController>(
                    init: LayoutController(),
                    builder: (controller) {
                      return InkWell(
                        onTap: (){
                          controller.exitLogin();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app_rounded,
                                  color: ProjectColors.accentColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Login Out",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color:
                                          ProjectColors.accentColor.withOpacity(0.8),
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_back_ios,
                              textDirection: TextDirection.rtl,
                              color: ProjectColors.accentColor,
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                    color: Colors.grey.withOpacity(0.3),
                    height: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class nameProfile extends StatelessWidget {
  final snapshot;

  const nameProfile({
    super.key,
    this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      snapshot.data!.docs[0].data()['name'],
      style: TextStyle(
          fontSize: 22,
          color: ProjectColors.accentColor,
          fontWeight: FontWeight.w900),
    );
  }
}
