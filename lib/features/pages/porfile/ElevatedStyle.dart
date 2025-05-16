import 'package:flutter/material.dart';

class Elevatedstyle extends StatelessWidget {
  String text;
  Color color;
  Color textColor;

   Elevatedstyle({required this.text,required this.color,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25))
          ),
          onPressed: (){}, child: Text(text,style: TextStyle(color: textColor),)),
    );
  }
}
