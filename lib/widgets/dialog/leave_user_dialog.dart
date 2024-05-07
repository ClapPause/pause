import 'package:flutter/material.dart';

import '../../constants/constants_color.dart';
import 'dialog_button.dart';

class LeaveUserDialog extends StatelessWidget {
  const LeaveUserDialog({super.key});

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
            '회원탈퇴',
            style: TextStyle(
              fontSize: 16,
              height: 20 / 16,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '회원 탈퇴 시 귀하와 연관된 정보들은\n모두 삭제되어 복구가 불가합니다.\n\n정말로 탈퇴하시겠습니까?',
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
                  title: '탈퇴하기',
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
