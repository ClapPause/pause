import 'package:flutter/material.dart';
import 'package:pause/models/user/user.dart';
import 'package:pause/screens/sign/welcome_screen.dart';
import 'package:pause/services/sign_service.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:pause/widgets/custom_action_button.dart';

import '../../constants/constants_color.dart';
import '../../constants/constants_reg.dart';
import '../../widgets/custom_text_field.dart';

class SignUpNameScreen extends StatefulWidget {
  final String email;
  final String password;

  const SignUpNameScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _nameController.text =
        "퍼즈${DateTime.now().microsecondsSinceEpoch.toString().padRight(16, "0").substring(10)}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kPrimaryColor,
        ),
        backgroundColor: kWhiteColor,
        body: Column(
          children: [
            const SizedBox(width: double.infinity, height: 100),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                '닉네임을 입력해주세요',
                style: TextStyle(
                  color: kBlack400,
                  fontSize: 24,
                  height: 28 / 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Text(
                '특수문자 사용 금지',
                style: TextStyle(
                  color: kBlack300,
                  fontSize: 12,
                  height: 14 / 12,
                ),
              ),
            ),
            CustomTextField(
              controller: _nameController,
              hintText: "닉네임",
              showObscureText: false,
              showClicked: () {},
            ),
            const SizedBox(height: 80),
            CustomActionButton(
              text: '다음',
              onTap: () async {
                if(!kNickNameRegExp.hasMatch(_nameController.text)){
                  showMessage(context, message: '닉네임에 특수문자는 사용할 수 없습니다.');
                  return;
                }
                if (_isPressed) return;
                _isPressed = true;
                User? user = await SignService.signUp(
                    widget.email, widget.password, _nameController.text);
                if (user != null && context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) =>  WelcomeScreen(user:user)),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
