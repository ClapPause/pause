import 'package:flutter/material.dart';

import '../constants/constants_color.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const CustomActionButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            height: 20/16,
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
