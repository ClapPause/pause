import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pause/constants/constants_reg.dart';
import 'package:pause/screens/sign/reset_password_screen.dart';
import 'package:pause/services/http_service.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:pause/widgets/custom_action_button.dart';
import 'package:pause/widgets/custom_text_field.dart';

import '../../constants/constants_color.dart';
import '../../utils/sign_in_utils.dart';

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({super.key});

  @override
  State<FindPasswordScreen> createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends State<FindPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _certifyCodeController = TextEditingController();

  String _certifyCode = "123456";

  bool _sendCertifyCode = false;

  void sendEmail() {
    if (!kEmailRegExp.hasMatch(_emailController.text)) {
      showMessage(context, message: '이메일 형식을 다시 한번 확인해 주세요.');
      return;
    }
    String newCertifyCode = getNewCertificationNumber();
    _certifyCode = newCertifyCode;
    log(_certifyCode);
    setState(() {
      _sendCertifyCode = true;
    });
    HttpService.sendEmail(
        email: _emailController.text, certifyCode: newCertifyCode);
  }

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
              '비밀번호를\n잊어버리셨나요?',
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
              '이메일로 발송된 코드를 입력해 주세요.',
              style: TextStyle(
                color: kBlack300,
                fontSize: 12,
                height: 16 / 12,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kTextFieldBorderColor,
                      ),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !_sendCertifyCode,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        counterText: '',
                        hintText: '이메일 주소',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: kTextFieldHintColor,
                          height: 20 / 14,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: kBlack300,
                        height: 20 / 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                if (!_sendCertifyCode)
                  GestureDetector(
                    onTap: sendEmail,
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kPrimaryColor,
                      ),
                      child: Text(
                        '인증',
                        style: TextStyle(
                          fontSize: 16,
                          height: 20 / 16,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kBlack100,
                    ),
                    child: Text(
                      '인증',
                      style: TextStyle(
                        fontSize: 16,
                        height: 20 / 16,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _certifyCodeController,
            hintText: '인증코드',
            maxLength: 6,
            showClicked: () {},
          ),
          const SizedBox(height: 30),
          CustomActionButton(
            text: '다음',
            onTap: () {
              if (_certifyCodeController.text != _certifyCode) {
                showMessage(context, message: "인증번호를 다시 한번 확인해 주세요.");
                return;
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPasswordScreen(
                    email: _emailController.text,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
