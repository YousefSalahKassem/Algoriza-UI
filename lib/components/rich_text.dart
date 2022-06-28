import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichTextApp extends StatelessWidget {
  String firstText,secondText;
  Color firstColor,secondColor;
  double firstSize,secondSize;
  FontWeight fistWeight,secondWeight;
  RichTextApp({Key? key,
    required this.firstText,required this.secondText,
    required this.firstColor,required this.secondColor,
    this.secondSize=16, this.firstSize=16,
    this.fistWeight=FontWeight.bold,this.secondWeight=FontWeight.bold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: firstText,
          style: GoogleFonts.poppins(textStyle: TextStyle(color: firstColor,fontWeight: fistWeight,fontSize: firstSize),),
          children: <TextSpan>[
            TextSpan(text: secondText, style: GoogleFonts.poppins(textStyle:TextStyle(fontWeight: secondWeight,color: secondColor,fontSize: secondSize))),
          ],
        ),
      ),
    );
  }
}
