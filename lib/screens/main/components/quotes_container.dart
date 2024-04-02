import 'package:flutter/material.dart';
import 'package:pause/constants/constants_list.dart';

import '../../../constants/constants_color.dart';

class QuotesContainer extends StatelessWidget {
  const QuotesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime nowDate = DateTime.now();
    int number = (nowDate.difference(DateTime(nowDate.year)).inDays %
            kQuotesList.length) -
        1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        kQuotesList[number],
        style: TextStyle(
          fontSize: 16,
          height: 20 / 16,
          fontStyle: FontStyle.italic,
          color: kBlack400,
        ),
      ),
    );
  }
}
