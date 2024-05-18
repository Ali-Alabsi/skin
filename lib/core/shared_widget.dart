
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skin/core/color.dart';

Widget NameTFF(String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('$name',
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 18,
        color: ProjectColors.mainColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}


TextFormField TFF({
  required IconData priIcon,
  required String name,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  required TextInputType keyboardType,
  void Function(String)? onChanged

}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    onChanged: onChanged ,
    keyboardType: keyboardType,
    inputFormatters: [NoSpaceTextInputFormatter()],
    decoration: InputDecoration(
        prefixIcon: Icon(priIcon,
          color: ProjectColors.mainColor,),
        contentPadding: EdgeInsets.symmetric(vertical: 22,
            horizontal: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                width: 3,
                color: ProjectColors.mainColor
            )
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                width: 2,
                color: ProjectColors.mainColor
            )
        ),
        hintText: '$name',
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey
        )
    ),
  );
}



bool isEmail(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  return emailRegex.hasMatch(email);
}

bool isPassword(String password) {
  // Define your password validation rules here
  // For example, at least 8 characters long with at least one uppercase letter and one digit
  final passwordRegex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  return passwordRegex.hasMatch(password);
}

class NoSpaceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains(' ')) {
      return oldValue;
    }
    return newValue;
  }
}