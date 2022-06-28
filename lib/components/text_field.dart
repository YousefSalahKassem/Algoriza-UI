import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldApp extends StatefulWidget {
TextEditingController? controller;
String? hint;
Icon? icon;
TextInputType? textInputType;
bool isPassword;
String validation;
TextFieldApp({Key? key,this.icon,required this.controller,this.hint,this.textInputType,required this.isPassword,required this.validation}) : super(key: key);

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
@override
Widget build(BuildContext context) {
  return TextFormField(
    controller: widget.controller!,
    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    keyboardType: widget.textInputType,
    obscureText: widget.isPassword,
    validator: (value){
      if(value==null || value.isEmpty){
        return widget.validation;
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: widget.hint,
      suffixIcon: widget.isPassword?IconButton(onPressed: (){
        setState((){
          widget.isPassword=!widget.isPassword;
        });
      }, icon: const Icon(FontAwesomeIcons.solidEye,color: Colors.black,)):null,
      hintStyle: TextStyle(color: Colors.grey.withOpacity(.3)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          )),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          )
      ),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red
          )),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          )
      ),
    ),
  );
}
}

