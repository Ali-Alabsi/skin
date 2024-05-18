
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'color.dart';

AwesomeDialog errorDialog({required BuildContext context,
  required String desc
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: 'Error',
    desc: desc,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: ProjectColors.mainColor,
  );
}


AwesomeDialog warningDialog({required BuildContext context,
  required String desc,
  void Function()? btnOkOnPress,
  void Function()? btnCancelOnPress
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: 'Warning',
    desc: desc,
    btnOkOnPress: btnOkOnPress,
    btnCancelOnPress:btnCancelOnPress,
    // btnOkIcon: Icons.check,
    // btnCancelIcon: Icons.close,
    btnCancelColor: Colors.grey,
    btnOkColor: ProjectColors.mainColor,
  );
}




AwesomeDialog infoDialog({required BuildContext context,
  required String desc
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: 'sure',
    desc: desc,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: ProjectColors.mainColor,
  );
}


AwesomeDialog successDialog({required BuildContext context,
  required String desc,
  void Function()? btnOkOnPress,
  void Function(DismissType)? onDismissCallback
}){
  return AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Succes',
      desc: desc,
      btnOkOnPress: btnOkOnPress,
      dismissOnBackKeyPress: false,
      btnOkIcon: Icons.check_circle,
      onDismissCallback: onDismissCallback
  );
}