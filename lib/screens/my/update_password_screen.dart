import 'package:flutter/material.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/services/user_service.dart';
import 'package:pause/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../constants/constants_color.dart';
import '../../constants/constants_enum.dart';
import '../../constants/constants_reg.dart';
import '../../models/user/user.dart';
import '../../services/sign_service.dart';
import '../../utils/local_utils.dart';
import '../../widgets/custom_action_button.dart';
import '../main/main_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
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
              User? user = context.read<UserController>().user;
              if (user == null) return;
              UserService.update(
                  id: user.id,
                  field: 'password',
                  value: _passwordController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
