import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/screens/main/main_screen.dart';
import 'package:pause/screens/sign/find_password_screen.dart';
import 'package:pause/screens/sign/sign_up_screen.dart';
import 'package:pause/services/sign_service.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:pause/widgets/custom_action_button.dart';
import 'package:pause/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../models/user/user.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
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
              inputType: TextInputType.emailAddress,
              showObscureText: false,
              showClicked: () {},
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              hintText: '비밀번호',
              showObscureText: true,
              showClicked: () => setState(() => _showPassword = !_showPassword),
            ),
            const SizedBox(height: 27),
            CustomActionButton(
              onTap: () async {
                User? user = await SignService.localSignIn(
                    _emailController.text, _passwordController.text);
                if (!context.mounted) return;
                if (user == null) {
                  showMessage(context, message: '이메일 주소와 비밀번호를 다시 한번 확인해 주세요.');
                  return;
                }
                context.read<UserController>().signIn(user);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindPasswordScreen()),
                      (route) => false,
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
      ),
    );
  }
}
