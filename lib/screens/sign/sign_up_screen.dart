import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/screens/sign/sign_up_email_screen.dart';
import '../../constants/constants_color.dart';
import '../../utils/sign_in_utils.dart';
import '../../widgets/custom_outlined_action_button.dart';
import '../../widgets/custom_social_sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          const SizedBox(height: 200),
          SizedBox(
            width: 236,
            height: 85,
            child: Image.asset(
              'assets/logo/sign_pause_logo.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '이미 회원이신가요?',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Text(
                  '로그인하기',
                  style: TextStyle(
                    fontSize: 12,
                    height: 14 / 12,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomOutlinedActionButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpEmailScreen(),
              ),
            ),
            text: '이메일로 계속하기',
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => kakaoSignIn(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 45),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: kKakaoColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 40,
                    child: Image.asset('assets/logo/social/kakao.png'),
                  ),
                  Text(
                    '카카오톡으로 계속하기',
                    style: TextStyle(
                      fontSize: 16,
                      height: 20 / 16,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '다른 방식으로 가입하기',
                style: TextStyle(
                  color: kBlack300,
                  fontSize: 12,
                  height: 14 / 12,
                ),
              ),
              const SizedBox(width: 10),
              CustomSocialSignInButton(
                onTap: () => naverSignIn(context),
                image: 'assets/logo/social/naver.png',
              ),
              const SizedBox(width: 10),
              if (Platform.isIOS)
                CustomSocialSignInButton(
                  onTap: () => appleSignIn(context),
                  image: 'assets/logo/social/apple.png',
                )
              else
                CustomSocialSignInButton(
                  onTap: () => googleSignIn(context),
                  image: 'assets/logo/social/google.jpg',
                ),
            ],
          ),
          const SizedBox(height: 87),
        ],
      ),
    );
  }
}
