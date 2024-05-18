
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../core/TFTcontroller.dart';
import '../../../core/color.dart';

import '../../../core/shared_widget.dart';
import '../../../main.dart';
AuthController contextGetX = Get.put(AuthController());
String navEmail = 'The email is written incorrectly';
String navPassword = 'The password provided is too weak.';
Widget SingUpScreen({
  required BuildContext context,
  required var formKey
}) {
  return Expanded(
    child: ListView(
      // shrinkWrap: true,
      children: [
        Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameTFF('Name'),
                  TFF(
                      name: 'Enter Your Name',
                      keyboardType:TextInputType.name,
                      priIcon: Icons.account_circle ,
                      controller: nameControllerSingUP,
                      validator: (val){
                        if (val == "") {
                          return "Please Agien Enter THe Name";
                        }
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NameTFF('Email'),
                  TFF(
                      name: 'Enter Your Email',
                      onChanged:  (value) {
                        emailControllerLogin.text = value!;
                      },
                      keyboardType:TextInputType.emailAddress,
                      priIcon: Icons.email ,
                      controller:  emailControllerSingUP,
                      validator: (val){
                        if (isEmail(val!) == false) {
                          return navEmail;
                        }
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NameTFF('Password'),
                  TFF(
                      name: 'Enter Your Password',
                      keyboardType:TextInputType.visiblePassword,
                      controller: passwordControllerSingUP,
                      validator: (val){
                        if (isPassword(val!) == false) {
                          return navPassword;
                        }
                      },
                      priIcon: Icons.lock_open),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller)=>
                     ButtomLogin(
                       child: controller.loadingSignUp ? CircleAvatar(  backgroundColor: Colors.white,): Text('Create Account'),
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            controller.signUpInFireBase(context);

                          }
                          }
                    ),
                  ),
                ],
              ),
            )),
      ],
    ),
  );
}



Widget LoginScreen({
  required BuildContext context,
  required var formKey
}) {
  return Expanded(
    child: ListView(
      children: [
        Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameTFF('Email'),
                  TFF(
                    name: 'Enter Your Email',
                    priIcon: Icons.email,
                    keyboardType:TextInputType.emailAddress,
                    controller: emailControllerLogin ,
                    validator:(val){
                      if (isEmail(val!) == false) {
                        return navEmail;
                      }
                    },

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NameTFF('Password'),
                  TFF(
                      name: 'Enter Your Password',
                      priIcon: Icons.lock_open ,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordControllerLogin,
                      validator: (val){
                        if (isPassword(val!) == false) {
                          return navPassword;
                        }
                      }
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) {
                      return ButtomLogin(
                        child:controller.loadingLogin==true ?  CircleAvatar( backgroundColor: Colors.white,) : Text('Login'),
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                              controller.loginInFireBase(context);
                            }
                          }
                      );
                    }
                  ),

                ],
              ),
            )),
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
      width: double.infinity,
      child: TextButton(
          onPressed: () {},
          child: Text(
            'forget Password',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          )));
}

Widget ButtomLogin({required void Function()? onPressed , required Widget child  } ) {
  return GetBuilder<AuthController>(
    init: AuthController(),
    builder: (getContext)=>
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ProjectColors.mainColor,
                minimumSize: Size(double.infinity, 50),
                maximumSize: Size(double.infinity, 50),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: onPressed,
            child:child,
          ),
        ),
  );
}





Widget ImageTopInLoginScreen() {
  return Stack(
    children: [
      Container(
        height: 300,
        margin: EdgeInsetsDirectional.only(
            bottom: 20
        ),
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 90,
            vertical: 40
        ),
        decoration: BoxDecoration(
            color: ProjectColors.mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )),
        width: double.infinity,
        child: Container(

         clipBehavior: Clip.antiAliasWithSaveLayer,
         decoration: BoxDecoration(
           color: Colors.white,
             borderRadius: BorderRadius.circular(50)
         ),
         child:Icon(
           Icons.account_circle_outlined,
           size: 180,
         )
          ),
      ),
    ],
  );
}

Positioned ButtomSelectLogin() {
  return Positioned(
    bottom: 0,
    left: 60 ,
    child: GetBuilder<AuthController>(
      init: AuthController(),
      builder: (getContext) =>
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: getContext.loginScreen ? ProjectColors.mainColor : Colors.white,
                  minimumSize: Size(140, 50),
                  maximumSize: Size(140, 50),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              onPressed: () {
                getContext.changeToLoginScreen();
              },
              child: Text('Login'),
            ),
          ),
    ),
  );
}
Positioned ButtomSelectSignUp() {
  return Positioned(
    bottom: 0,
    right: 60 ,
    child: GetBuilder<AuthController>(
      init: AuthController(),
      builder: (getContext)=>
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:getContext.loginScreen? Colors.white:ProjectColors.mainColor ,
                  minimumSize: Size(140, 50),
                  maximumSize: Size(140, 50),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              onPressed: () {
                getContext.changeToSingUpScreen();
              },
              child: Text('Sing Up'),
            ),
          ),
    ),
  );
}