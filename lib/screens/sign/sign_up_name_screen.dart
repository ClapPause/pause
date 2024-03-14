import 'package:flutter/material.dart';

import '../../constants/constants_color.dart';

class SignUpNamScreen extends StatefulWidget {
  const SignUpNamScreen({Key? key}) : super(key: key);

  @override
  State<SignUpNamScreen> createState() => _SignUpNamScreenState();
}

class _SignUpNamScreenState extends State<SignUpNamScreen> {
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
          children: [Text('닉네임을 입력해주세요'),Text('특수문자 사용 금지'),
          ],
        ),
      ),
    );
  }
}
