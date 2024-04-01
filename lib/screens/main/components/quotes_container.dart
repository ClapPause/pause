import 'package:flutter/material.dart';

import '../../../constants/constants_color.dart';

class QuotesContainer extends StatelessWidget {
  const QuotesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '"천천히 가도 괜찮아\n나를 잃지만 않으면 돼."',
          style: TextStyle(
            fontSize: 24,
            height: 40 / 24,
            fontStyle: FontStyle.italic,
            color: kBlack400,
          ),
        ),
        Text(
          'from. 곰돌이 푸',
          style: TextStyle(
            fontSize: 12,
            height: 40 / 12,
            color: kBlack400,
          ),
        ),
      ],
    );
  }
}
