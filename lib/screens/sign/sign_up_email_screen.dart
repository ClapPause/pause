import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/widgets/custom_action_button.dart';

import '../../widgets/custom_text_field.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool _showPassword = false;
  bool _showPasswordCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kPrimaryColor,
      ),
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          const SizedBox(height: 100),
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false,
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
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordCheckController,
            hintText: '비밀번호확인',
            textChanged: (text) => setState(() {}),
            showObscureText: true,
            showClicked: () =>
                setState(() => _showPasswordCheck = !_showPasswordCheck),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: const Column(
                children: [],
              ),
            ),
          ),
          CustomActionButton(
            text: '회원가입',
            onTap: () {},
          ),
          const SizedBox(height: 87),
        ],
      ),
    );
  }
}
