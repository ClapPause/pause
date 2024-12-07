import 'package:flutter/material.dart';
import 'package:pause/models/question/question.dart';

import '../../../constants/constants_color.dart';
import '../../../utils/date_utils.dart';

class QuestionCard extends StatelessWidget {
  final void Function() onTap;
  final Question question;

  const QuestionCard({super.key, required this.question, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 27, right: 27, bottom: 20),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF999999).withOpacity(0.6)),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            Text(
              getQuestionDate(question.openTimeStamp),
              style: TextStyle(
                color: kBlack200,
                fontSize: 10,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                'Q${question.number}. ${question.question}',
                style: TextStyle(
                  height: 22 / 16,
                  fontSize: 16,
                  color: kBlack400,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFFFA5A5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '답변 보기',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
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
