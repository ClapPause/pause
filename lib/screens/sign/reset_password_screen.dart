import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/constants/constants_enum.dart';
import 'package:pause/constants/constants_reg.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/services/sign_service.dart';

import '../../utils/local_utils.dart';
import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool _showPassword = false;
  bool _showPasswordCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kPrimaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              '비밀번호 재설정',
              style: TextStyle(
                color: kBlack400,
                fontSize: 24,
                height: 28 / 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              '새로운 비밀번호를 설정해 주세요.',
              style: TextStyle(
                color: kBlack300,
                fontSize: 12,
                height: 16 / 12,
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomTextField(
            controller: _passwordController,
            hintText: '비밀번호 ( 영문, 숫자 혼합 8자이상 )',
            showObscureText: true,
            showClicked: () => setState(() => _showPassword = !_showPassword),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordCheckController,
            hintText: '비밀번호확인',
            showObscureText: true,
            showClicked: () =>
                setState(() => _showPasswordCheck = !_showPasswordCheck),
          ),
          const SizedBox(height: 30),
          CustomActionButton(
            text: '다음',
            onTap: () async {
              if (!kPasswordRegExp.hasMatch(_passwordController.text)) {
                showMessage(context, message: "비밀번호 형식을 다시 한번 확인해 주세요.");
                return;
              }
              if (_passwordCheckController.text != _passwordController.text) {
                showMessage(context, message: "비밀번호가 일치하지 않습니다.");
                return;
              }

              ServiceReturnType status = await SignService.resetPassword(
                  widget.email, _passwordController.text);
              if(!context.mounted) return;
              if (status == ServiceReturnType.success) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
                showMessage(context, message: '새로 설정된 비밀번호로 로그인 해주세요.');
              }
              if(status == ServiceReturnType.failed){
                showMessage(context, message: '가입된 이메일이 존재하지 않습니다.');
              }
              if(status == ServiceReturnType.error){
                showMessage(context, message: '해당 이메일은 소셜 로그인으로 가입된 계정입니다.');
              }
            },
          ),
        ],
      ),
    );
  }
}
