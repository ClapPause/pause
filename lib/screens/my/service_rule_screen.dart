import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pause/constants/constants_html.dart';

import '../../constants/constants_color.dart';
import '../main/main_screen.dart';

class ServiceRuleScreen extends StatelessWidget {
  const ServiceRuleScreen({super.key});

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
          '서비스 이용 약관',
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
          Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const ClampingScrollPhysics(),
                children: const [
                  HtmlWidget(
                    serviceHTML,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
