import 'package:flutter/material.dart';
import 'package:pause/services/local_service.dart';

import '../../constants/constants_color.dart';
import '../main/main_screen.dart';

class AutoLoginSettingScreen extends StatefulWidget {
  const AutoLoginSettingScreen({super.key});

  @override
  State<AutoLoginSettingScreen> createState() => _AutoLoginSettingScreenState();
}

class _AutoLoginSettingScreenState extends State<AutoLoginSettingScreen> {
  bool _autoLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalService.getUserAutoLogin().then((value) {
      setState(() => _autoLogin = value);
    });
  }

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
          '자동로그인 설정',
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFD9D9D9),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              children: [
                Text(
                  '자동로그인',
                  style: TextStyle(
                    fontSize: 16,
                    height: 20 / 16,
                    color: kBlack300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: _autoLogin,
                  onChanged: (value) {
                    setState(() => _autoLogin = value);
                    LocalService.saveAutoLogin(value);
                  },
                  activeColor: kPrimaryBackgroundColor,
                  activeTrackColor: kPrimaryColor,
                  inactiveThumbColor: kBlack200,
                  inactiveTrackColor: kBlack100,
                  trackOutlineWidth:
                      WidgetStateProperty.resolveWith((states) => 0),
                  trackOutlineColor: WidgetStateProperty.resolveWith(
                      (Set states) => kBlack100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
