import 'package:flutter/material.dart';
import 'package:pause/constants/constants_reg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/user/user.dart';
import 'package:pause/screens/main/main_screen.dart';
import 'package:pause/screens/my/components/setting_info_container.dart';
import 'package:pause/screens/my/update_password_screen.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:provider/provider.dart';

import '../../constants/constants_color.dart';

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
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFD9D9D9),
          ),
          const SettingInfoContainer(),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFD9D9D9),
          ),
          kActionContainer(
            title: '비밀번호 변경',
            onTap: () {
              User? user = context.read<UserController>().user;
              if (user == null) return;
              if (!kPasswordRegExp.hasMatch(user.password)) {
                showMessage(context,
                    message: '소셜로그인 이용자는 비밀번호를 \n설정하거나 변경할 수 없습니다.');
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UpdatePasswordScreen()),
              );
            },
          ),
          kActionContainer(title: '자동로그인 설정', onTap: () {}),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFD9D9D9),
          ),
          kActionContainer(title: '로그아웃', onTap: () {}),
          kActionContainer(title: '회원탈퇴', onTap: () {}),
        ],
      ),
    );
  }

  Widget kActionContainer(
      {required String title, required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kBlack200,
            ),
          ],
        ),
      ),
    );
  }
}
