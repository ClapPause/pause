import 'package:flutter/material.dart';

class CustomSocialSignInButton extends StatelessWidget {
  final Function onTap;
  final String image;

  const CustomSocialSignInButton({
    Key? key,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: 26,
        height: 26,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            image,
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }
}
