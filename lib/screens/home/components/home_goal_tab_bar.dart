import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';

class HomeGoalTabBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  const HomeGoalTabBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kBoxBorderColor),
        ),
      ),
      child: Row(
        children: [
          kHomeGoalTabBarItem(0, "주간"),
          kHomeGoalTabBarItem(1, "월간"),
        ],
      ),
    );
  }

  Widget kHomeGoalTabBarItem(int index, String title) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Container(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: 58,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: index == currentIndex
                  ? Border(
                      bottom: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    )
                  : null,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: index == currentIndex ? kPrimaryColor : kBlack100,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
