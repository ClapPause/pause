import 'package:flutter/material.dart';

class ServiceContainer extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const ServiceContainer({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFBCBCBC),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
