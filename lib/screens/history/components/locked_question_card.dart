import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pause/models/question/question.dart';

import '../../../constants/constants_color.dart';

class LockedQuestionCard extends StatelessWidget {
  final Question question;

  const LockedQuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /**
         * 1. 광고를 시청한다
         * 2. 올바르게 광고를 시청했을경우 잠금을 풀어준다 => answered = true;answerTimeStamp = 잠금해제시각, answer : "" 로 update
         */
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(left: 27, right: 27, bottom: 20),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBlackColor),
          color: kBlackColor.withOpacity(0.6),
        ),
        child: Stack(
          children: [
            Center(
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
            Center(
              child: SvgPicture.asset('assets/icon/lock.svg'),
            )
          ],
        ),
      ),
    );
  }
}
