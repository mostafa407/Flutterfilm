import 'package:flutter/material.dart';
import 'package:flutter_film/constant/colors.dart';
class Charcterinfo extends StatelessWidget {
  String title;
  String value;
  Charcterinfo({super.key,required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColor.white,
            fontSize: 16
          )
        )
      ]
    ));
  }
}
