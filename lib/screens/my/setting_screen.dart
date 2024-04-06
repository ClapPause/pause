import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pause/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/constants_color.dart';
import '../../controllers/user_controller.dart';
import '../sign/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.centerRight,
            width: 40,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF8A8A8A),
            ),
          ),
        ),
        leadingWidth: 40,
        surfaceTintColor: kWhiteColor,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(
          '설정',
          style: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false),
            child: const Icon(
              Icons.home_outlined,
              color: Color(0xFF8A8A8A),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Consumer<UserController>(builder: (context, controller, child) {
        if (controller.user == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        }
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFD9D9D9),
            ),
            const SizedBox(height: 30),
          ],
        );
      }),

    );
  }
}
