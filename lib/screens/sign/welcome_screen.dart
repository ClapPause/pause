import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/models/user/user.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/widgets/custom_action_button.dart';

class WelcomeScreen extends StatelessWidget {
  final User user;

  const WelcomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              '${user.name}님,\n가입을 축하합니다🎉',
              style: TextStyle(
                fontSize: 24,
                height: 28 / 24,
                color: kBlack400,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              '퍼즈에 오신 것을 환영합니다!\n저희와 함께 알찬 시간을 만들어 보세요.',
              style: TextStyle(
                fontSize: 14,
                height: 20 / 14,
                color: kBlack300,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              flex: 2, child: Image.asset('assets/image/sign_welcome.png')),
          CustomActionButton(
            text: '확인',
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
