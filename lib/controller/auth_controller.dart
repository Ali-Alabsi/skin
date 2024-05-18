import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/TFTcontroller.dart';
import '../core/dialog.dart';
import '../view/screen/home.dart';
import '../view/screen/layout.dart';

class AuthController extends GetxController{
  bool loginScreen = true;
  bool loadingSignUp = false;
  bool loadingLogin = false;
  void changeToloadingSignUp(){
    loadingSignUp =true;
    update();
  }

  void changeToStoploadingSignUp(){
    loadingSignUp =false;
    update();
  }
  void changeToloadingLogin(){
    loadingLogin =true;
    update();
  }

  void changeToStoploadingLogin(){
    loadingLogin =false;
    update();
  }
  void changeToLoginScreen(){
    loginScreen =true;
    update();
  }
  void changeToSingUpScreen(){
    loginScreen =false;
    update();
  }
  Future signUpInFireBase(context) async {
    changeToloadingSignUp();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "${emailControllerSingUP.text}",
        password: passwordControllerSingUP.text,
      );
      print('Succes');
     await addUser(credential.user!.uid);
      emailControllerSingUP.clear();
      passwordControllerSingUP.clear();
      nameControllerSingUP.clear();
      changeToStoploadingSignUp();
      successDialog(context: context, desc:'Create Account Is Success' ,btnOkOnPress: (){}).show();
      changeToLoginScreen();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        changeToStoploadingSignUp();
        errorDialog(
            context:  context,
            desc:'The account already exists for that email.'
        ).show();
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      print('FirebaseException');
    }
  }

  Future addUser( userid)async{
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    users.add({
      'name': nameControllerSingUP.text, // John Doe
      'email': emailControllerSingUP.text, // Stokes and Sons
      'is': userid // 42
    }).then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }

  Future loginInFireBase(context) async{
    try {
      changeToloadingLogin();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "${emailControllerLogin.text}",
        password: passwordControllerLogin.text,
      );
      changeToStoploadingSignUp();
      changeToStoploadingLogin();
      Get.offNamed('Layout');
      changeToStoploadingLogin();


    } on FirebaseAuthException catch (e)   {
      changeToStoploadingLogin();
      if (e.code == 'user-not-found') {
        changeToStoploadingLogin();
        errorDialog(
            context:  context,
            desc:'No user found for that email.'
        ).show();
        // print('No user found for that email.');

      }
      else if (e.code == 'wrong-password') {
        changeToStoploadingSignUp();
        errorDialog(
            context:  context,
            desc:'Wrong password provided for that user..'
        ).show();
        // print('Wrong password provided for that user.');
      }
      else{
        changeToStoploadingSignUp();
        errorDialog(
            context:  context,
            desc:'${e.code}'
        ).show();

      }
    }
  }
}