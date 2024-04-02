import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pause/models/question/question.dart';

import '../../../constants/constants_color.dart';

class QuestionContainer extends StatelessWidget {
  final void Function() onTap;
  final Question question;
  const QuestionContainer({super.key, required this.onTap, required this.question});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
            horizontal: 36),
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFCC8484),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 5,
              color: kBlackColor.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                question.question,
                style: TextStyle(
                  color: kBlackColor,
                  height: 24 / 16,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 22),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFFA5A5),
                borderRadius:
                BorderRadius.circular(15),
              ),
              child: Text(
                '기록하기',
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
    );
  }
}
