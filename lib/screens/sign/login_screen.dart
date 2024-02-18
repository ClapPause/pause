import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/screens/main/main_screen.dart';
import 'package:pause/screens/sign/find_password_screen.dart';
import 'package:pause/screens/sign/sign_up_screen.dart';
import 'package:pause/screens/sign/social_login_result_screen.dart';
import 'package:pause/widgets/custom_action_button.dart';
import 'package:pause/widgets/custom_text_field.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void kakaoSignIn() async {
    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      User user = await UserApi.instance.me();
      String? userEmail = user.kakaoAccount?.email;
      if (userEmail == null) throw Exception('이메일이 존재하지 않습니다');
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SocialLoginResultScreen(social: 'kakao', email: userEmail)));
    } catch (e) {
      log('kakaoSignIn Error : $e');
      return;
    }
  }

  void naverSignIn() async {
    try {
      NaverLoginResult result = await FlutterNaverLogin.logIn();
      if (result.status != NaverLoginStatus.loggedIn) {
        throw Exception('로그인을 실패했습니다');
      }
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SocialLoginResultScreen(
            social: 'naver',
            email: result.account.email,
          ),
        ),
      );
    } catch (e) {
      return;
    }
  }

  void appleSignIn() async {
    try {
      AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
      );
      if (credential.identityToken == null) {
        throw Exception('로그인을 실패했습니다');
      }
      List<String> jwt = credential.identityToken?.split('.') ?? [];
      String payload = jwt[1];
      payload = base64.normalize(payload);

      final List<int> jsonData = base64.decode(payload);
      final userInfo = jsonDecode(utf8.decode(jsonData));
      String email = userInfo['email'];
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SocialLoginResultScreen(social: 'apple', email: email)));
    } catch (e) {
      log('appleSignIn Error : $e');
      return;
    }
  }

  void googleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account == null) throw Exception('로그인을 실패했습니다');
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SocialLoginResultScreen(
                  social: 'google', email: account.email)));
    } catch (e) {
      log('googleSignIn Error : $e');
      return;
    }
  }

  void loginWithEmailAndPassword() {
    try {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Validate email and password
      if (email.isEmpty || !email.contains('@')) {
        _showErrorMessage('올바른 이메일 주소를 입력하세요.');
        return;
      }

      if (password.length < 9 ||
          !password.contains(RegExp(r'[a-zA-Z]')) ||
          !password.contains(RegExp(r'[0-9]'))) {
        _showErrorMessage('비밀번호는 9자 이상이어야 하며,\n 영문과 숫자를 모두 포함해야 합니다.');
        return;
      }

      // Simulate authentication without using FirebaseAuth
      if (_fakeUserCredentials.containsKey(email) &&
          _fakeUserCredentials[email] == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        _showErrorMessage('로그인에 실패했습니다.');
      }
    } catch (e) {
      log('loginWithEmailAndPassword Error: $e');
      _showErrorMessage('로그인에 실패했습니다.');
    }
  }

  // Simulated user credentials (replace this with your actual user data)
  final Map<String, String> _fakeUserCredentials = {
    'user1@example.com': 'password1',
    'user2@example.com': 'password2',
  };

  // 파이어 베이스 코드
  //   Future<void> loginWithEmailAndPassword() async {
  //   try {
  //     String email = _emailController.text;
  //     String password = _passwordController.text;

  //     // Validate email and password
  //     if (email.isEmpty || !email.contains('@')) {
  //       _showErrorMessage('올바른 이메일 주소를 입력하세요.');
  //       return;
  //     }

  //     if (password.length < 9 ||
  //         !password.contains(RegExp(r'[a-zA-Z]')) ||
  //         !password.contains(RegExp(r'[0-9]'))) {
  //       _showErrorMessage('비밀번호는 9자 이상이어야 하며, 영문과 숫자를 모두 포함해야 합니다.');
  //       return;
  //     }

  //     // Check if email exists in Firestore
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: email)
  //         .get();

  //     if (querySnapshot.docs.isEmpty) {
  //       _showErrorMessage('등록되지 않은 이메일 주소입니다.');
  //       return;
  //     }

  //     // Email exists, check if password matches
  //     String storedPassword = querySnapshot.docs.first['password'];

  //     if (storedPassword == password) {
  //       // Passwords match, proceed with login
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const MainScreen()),
  //       );
  //     } else {
  //       // Passwords don't match
  //       _showErrorMessage('비밀번호가 일치하지 않습니다.');
  //     }
  //   } catch (e) {
  //     log('loginWithEmailAndPassword Error: $e');
  //     _showErrorMessage('로그인에 실패했습니다.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          const Spacer(flex: 4),
          SizedBox(
            width: 236,
            height: 85,
            child: Image.asset(
              'assets/logo/pause_logo.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '회원이 아니신가요?',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: Text(
                  '회원가입하기',
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
            textChanged: (text) => setState(() {}),
            inputType: TextInputType.emailAddress,
            obscureText: false,
            showClicked: () {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordController,
            hintText: '비밀번호',
            textChanged: (text) => setState(() {}),
            obscureText: !_showPassword,
            showClicked: () => setState(() => _showPassword = !_showPassword),
          ),
          const SizedBox(height: 27),
          CustomActionButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            ),
            // onTap: () => loginWithEmailAndPassword(),
            text: '로그인 하기',
          ),
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SNS 간편 로그인',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 10),
              kCustomSocialSignIn(
                onTap: () => kakaoSignIn(),
                image: 'assets/logo/social/kakao.png',
              ),
              const SizedBox(width: 10),
              kCustomSocialSignIn(
                onTap: () => naverSignIn(),
                image: 'assets/logo/social/naver.png',
              ),
              const SizedBox(width: 10),
              if (Platform.isIOS)
                kCustomSocialSignIn(
                  onTap: () => appleSignIn(),
                  image: 'assets/logo/social/apple.png',
                )
              else
                kCustomSocialSignIn(
                  onTap: () => googleSignIn(),
                  image: 'assets/logo/social/google.jpg',
                ),
            ],
          ),
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '비밀번호를 잃어버리셨나요?',
                style: TextStyle(
                  fontSize: 12,
                  height: 14 / 12,
                  color: kBlack300,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindPasswordScreen()),
                  );
                },
                child: Text(
                  '비밀번호찾기',
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
          const SizedBox(height: 87),
        ],
      ),
    );
  }

  Widget kCustomSocialSignIn({required Function onTap, required String image}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: 26,
        height: 26,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            image,
            width: 26,
            height: 26,
          ),
        ),
      ),
    );
  }
}
