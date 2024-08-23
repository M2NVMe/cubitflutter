import 'package:flutter/material.dart';

class myOutlinedButton extends StatelessWidget {

  final VoidCallback onPressed;
  final Color borderSide;
  final Color textColor;
  final String text;

  const myOutlinedButton({super.key, required this.onPressed, required this.borderSide, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed,
    style:
      OutlinedButton.styleFrom(
        side: BorderSide(color: borderSide)
      )
      , child:
      Text(text, style: TextStyle(color: textColor),),
    );
  }
}
