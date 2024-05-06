import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/models/information/information.dart';
import 'package:pause/screens/my/information_screen.dart';
import 'package:pause/services/information_service.dart';
import 'package:provider/provider.dart';

import '../../../controllers/user_controller.dart';
import '../../../utils/local_utils.dart';
import '../../sign/login_screen.dart';

class SettingInfoContainer extends StatelessWidget {
  const SettingInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, controller, child) {
      if (controller.user == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      }
      return Container(
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InformationScreen(),
                ),
              ),
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    "회원정보",
                    style: TextStyle(
                      color: kBlack300,
                      fontSize: 14,
                      height: 20 / 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kBlack300,
                    size: 16,
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            kInfoCard("이메일", controller.user!.email),
            kInfoCard("이름", controller.user!.name),
            FutureBuilder(
              future: InformationService.getInformation(controller.user!.id),
              builder: (context, snapshot) {
                Information? information = snapshot.data;
                if (information == null) {
                  return Column(
                    children: [
                      kInfoCard("휴대전화", ''),
                      kInfoCard("생년월일", ''),
                      kInfoCard("직업", ''),
                    ],
                  );
                }
                return Column(
                  children: [
                    kInfoCard("휴대전화", getPhone(information.phone)),
                    kInfoCard("생년월일", getDate(information.birthday)),
                    kInfoCard("직업", information.job),
                  ],
                );
              },
            ),
          ],
        ),
      );
    });
  }

  Widget kInfoCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                color: kBlack200,
                fontSize: 12,
                height: 14 / 12,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: kBlack200,
                fontSize: 12,
                height: 14 / 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
