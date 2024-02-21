import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/screens/main/main_screen.dart';
import 'package:pause/screens/sign/find_password_screen.dart';
import 'package:pause/screens/sign/sign_up_screen.dart';
import 'package:pause/widgets/custom_action_button.dart';
import 'package:pause/widgets/custom_text_field.dart';

import '../../utils/sign_in_utils.dart';
import '../../widgets/custom_social_sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

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
              'assets/logo/pause_logo.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '회원이 아니신가요?',
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
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: Text(
                  '회원가입하기',
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
          CustomTextField(
            controller: _emailController,
            hintText: '이메일 주소',
            textChanged: (text) => setState(() {}),
            inputType: TextInputType.emailAddress,
            showObscureText: false,
            showClicked: () {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordController,
            hintText: '비밀번호',
            textChanged: (text) => setState(() {}),
            showObscureText: true,
            showClicked: () => setState(() => _showPassword = !_showPassword),
          ),
          const SizedBox(height: 27),
          CustomActionButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            ),
            // onTap: () => loginWithEmailAndPassword(),
            text: '로그인 하기',
          ),
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SNS 간편 로그인',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 10),
              CustomSocialSignInButton(
                onTap: () => kakaoSignIn(context),
                image: 'assets/logo/social/kakao.png',
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
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '비밀번호를 잃어버리셨나요?',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindPasswordScreen()),
                  );
                },
                child: Text(
                  '비밀번호찾기',
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
          const SizedBox(height: 87),
        ],
      ),
    );
  }
}
