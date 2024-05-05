import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pause/screens/history/history_screen.dart';

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
                  icon: 'assets/image/main_career.png',
                  onTap: () {},
                ),
                const SizedBox(width: 20),
                kBottomIcon(
                  icon: 'assets/image/main_history.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                kBottomIcon(
                  icon: 'assets/image/main_test.png',
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
