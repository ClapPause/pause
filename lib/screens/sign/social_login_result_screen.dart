import 'package:flutter/material.dart';

import '../../constants/constants_color.dart';

class SocialLoginResultScreen extends StatelessWidget {
  final String social;
  final String email;

  const SocialLoginResultScreen(
      {super.key, required this.social, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlack300,
        elevation: 0,
        title: Text(
          '소셜 로그인 결과',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 28 / 18,
            letterSpacing: -0.5,
            color: kBlack300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('로그인 소셜 : $social'),
            Text('결과(이메일) : $email'),
          ],
        ),
      ),
    );
  }
}
