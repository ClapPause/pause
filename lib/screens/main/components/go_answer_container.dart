import 'package:flutter/material.dart';

import '../../../constants/constants_color.dart';

class GoAnswerContainer extends StatelessWidget {
  final void Function() onTap;

  const GoAnswerContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 80,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 36),
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF999999).withOpacity(0.6),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2,
                color: kBlackColor.withOpacity(0.25),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                '오늘의 질문이 왔어요!!',
                style: TextStyle(
                  color: kBlackColor,
                  height: 16 / 14,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              Container(
                alignment: Alignment.center,
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA5A5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '답변하러 가기',
                  style: TextStyle(
                    fontSize: 14,
                    height: 16 / 14,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
