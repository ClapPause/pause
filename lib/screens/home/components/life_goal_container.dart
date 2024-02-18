import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';

class LifeGoalContainer extends StatelessWidget {
  const LifeGoalContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              '나의 인생목표',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 117,
            decoration: BoxDecoration(
              border: Border.all(
                color: kBoxBorderColor,

              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "“명예로운 삶을 통해\n행복하기”",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kFontColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
