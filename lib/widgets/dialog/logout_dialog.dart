import 'package:flutter/material.dart';

import '../../constants/constants_color.dart';
import 'dialog_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: kWhiteColor,
      surfaceTintColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          Text(
            '로그아웃',
            style: TextStyle(
              fontSize: 16,
              height: 20 / 16,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '추후 로그인 시,\n기존의 모든 정보는 유지됩니다.',
            style: TextStyle(
              fontSize: 14,
              color: kBlack300,
              height: 16 / 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                DialogButton(
                  title: '닫기',
                  onTap: () => Navigator.pop(context),
                  backgroundColor: const Color(0xFFD9D9D9),
                  titleColor: kBlack300,
                ),
                const SizedBox(width: 10),
                DialogButton(
                  title: '로그아웃',
                  onTap: () => Navigator.pop(context, true),
                  backgroundColor: kPrimaryColor,
                  titleColor: kPrimaryBackgroundColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
