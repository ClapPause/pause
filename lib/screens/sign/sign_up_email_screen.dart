import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/constants/constants_reg.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/screens/sign/sign_up_name_screen.dart';
import 'package:pause/services/sign_service.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:pause/widgets/custom_action_button.dart';

import '../../widgets/custom_text_field.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool _showPassword = false;
  bool _showPasswordCheck = false;

  bool _showAgreements = false;
  bool _agreeTermsOfUse = false;
  bool _agreeCollectPersonalInformation = false;
  bool _agreeReceiveMarketingInformationAndProvidePersonalInformation = false;

  bool get agreeAll =>
      _agreeTermsOfUse &&
      _agreeCollectPersonalInformation &&
      _agreeReceiveMarketingInformationAndProvidePersonalInformation;

  void agreeAllFunction() {
    setState(() {
      if (!agreeAll) {
        _agreeTermsOfUse = true;
        _agreeCollectPersonalInformation = true;
        _agreeReceiveMarketingInformationAndProvidePersonalInformation = true;
        return;
      }
      _agreeTermsOfUse = false;
      _agreeCollectPersonalInformation = false;
      _agreeReceiveMarketingInformationAndProvidePersonalInformation = false;
    });
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
            const SizedBox(height: 80),
            SizedBox(
              width: 236,
              height: 85,
              child: Image.asset(
                'assets/logo/sign_pause_logo.png',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '이미 회원이신가요?',
                  style: TextStyle(
                    fontSize: 12,
                    height: 14 / 12,
                    color: kBlack300,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    '로그인하기',
                    style: TextStyle(
                      fontSize: 12,
                      height: 14 / 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: _emailController,
              hintText: '이메일 주소',
              inputType: TextInputType.emailAddress,
              showObscureText: false,
              showClicked: () {},
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: agreeAllFunction,
                    child: Row(
                      children: [
                        if (agreeAll)
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.check,
                              color: kWhiteColor,
                              size: 16,
                            ),
                          )
                        else
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: kCheckBoxBorderColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '전체 약관 동의',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              color: kBlack400,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(
                              () => _showAgreements = !_showAgreements),
                          child: Icon(
                            _showAgreements
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: kCheckBoxBorderColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: kBlack400,
                  ),
                  const SizedBox(height: 10),
                  if (_showAgreements)
                    // TODO 약관 클릭시 페이지 이동해주기
                    Column(
                      children: [
                        getSubTermContainer(
                          value: _agreeTermsOfUse,
                          title: '[필수] 퍼즈 이용 약관에 동의',
                          onTap: () {},
                          valueChange: () => setState(
                              () => _agreeTermsOfUse = !_agreeTermsOfUse),
                        ),
                        getSubTermContainer(
                          value: _agreeCollectPersonalInformation,
                          title: '[필수] 개인정보 수집 및 이용에 동의',
                          onTap: () {},
                          valueChange: () => setState(() =>
                              _agreeCollectPersonalInformation =
                                  !_agreeCollectPersonalInformation),
                        ),
                        getSubTermContainer(
                          value:
                              _agreeReceiveMarketingInformationAndProvidePersonalInformation,
                          title: '[선택] 마케팅 정보 수신 및 선택적 개인정보 제공',
                          onTap: () {},
                          valueChange: () => setState(() =>
                              _agreeReceiveMarketingInformationAndProvidePersonalInformation =
                                  !_agreeReceiveMarketingInformationAndProvidePersonalInformation),
                        ),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: CustomActionButton(
              text: '회원가입',
              onTap: () async{
                if (!kEmailRegExp.hasMatch(_emailController.text)) {
                  showMessage(context, message: "이메일을 다시 한번 확인해 주세요.");
                  return;
                }
                if (!kPasswordRegExp.hasMatch(_passwordController.text)) {
                  showMessage(context, message: "비밀번호 형식을 다시 한번 확인해 주세요.");
                  return;
                }
                if (_passwordCheckController.text != _passwordController.text) {
                  showMessage(context, message: "비밀번호가 일치하지 않습니다.");
                  return;
                }
                if (!_agreeTermsOfUse) {
                  showMessage(context, message: "퍼즈 이용 약관에 동의해야 가입할 수 있습니다.");
                  return;
                }
                if (!_agreeCollectPersonalInformation) {
                  showMessage(context,
                      message: "개인정보 수집 및 이용에 동의해야 가입할 수 있습니다.");
                  return;
                }
                if(await SignService.isSignedUser(_emailController.text)&&context.mounted){
                  showMessage(context,
                      message: "이미 가입된 이메일 입니다. 로그인을 진행해 주세요.");
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SignUpNameScreen(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getSubTermContainer(
      {required bool value,
      required String title,
      required void Function() onTap,
      required void Function() valueChange}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: GestureDetector(
          onTap: valueChange,
          child: Row(
            children: [
              value
                  ? Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.check,
                        color: kWhiteColor,
                        size: 12,
                      ),
                    )
                  : Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        border: Border.all(color: kCheckBoxBorderColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    height: 16 / 12,
                    color: kBlack400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: kBoxBorderColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
