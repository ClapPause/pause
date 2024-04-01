import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/constants_color.dart';

class BottomBar extends StatelessWidget {
  final void Function() onTap;
  const BottomBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kBottomIcon(
                  icon: 'assets/icon/main_career.svg',
                  onTap: () {},
                ),
                const SizedBox(width: 20),
                kBottomIcon(
                  icon: 'assets/icon/main_history.svg',
                  onTap: () {},
                ),
                const SizedBox(width: 20),
                kBottomIcon(
                  icon: 'assets/icon/main_test.svg',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget kBottomIcon({
    required String icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            color: kBlackColor.withOpacity(0.25),
            blurRadius: 2,
          )
        ]),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
