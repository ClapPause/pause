import 'package:flutter/material.dart';
import 'package:pause/screens/my/my_screen.dart';

import '../constants/constants_color.dart';

class PauseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PauseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        width: 40,
      ),
      leadingWidth: 40,
      surfaceTintColor: kWhiteColor,
      backgroundColor: kWhiteColor,
      foregroundColor: kPrimaryColor,
      centerTitle: true,
      title: Image.asset('assets/logo/pause_logo.png'),
      actions: [
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyScreen())),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/image/main_mypage.png'),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
