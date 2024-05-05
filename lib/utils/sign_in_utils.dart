import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/user/user.dart' as model_user;
import 'package:pause/screens/main/main_screen.dart';
import 'package:pause/screens/sign/sign_up_name_screen.dart';
import 'package:pause/services/local_service.dart';
import 'package:pause/services/sign_service.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

void kakaoSignIn(BuildContext context) async {
  try {
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
    User user = await UserApi.instance.me();
    String? userEmail = user.kakaoAccount?.email;
    if (userEmail == null) throw Exception('이메일이 존재하지 않습니다');
    if (!context.mounted) return;
    socialSignIn(context,userEmail,'kakao');
  } catch (e) {
    log('kakaoSignIn Error : $e');
    return;
  }
}

void naverSignIn(BuildContext context) async {
  try {
    NaverLoginResult result = await FlutterNaverLogin.logIn();
    if (result.status != NaverLoginStatus.loggedIn) {
      throw Exception('로그인을 실패했습니다');
    }
    if (!context.mounted) return;
    socialSignIn(context, result.account.email,'naver');
  } catch (e) {
    return;
  }
}

void appleSignIn(BuildContext context) async {
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
    if (!context.mounted) return;
    socialSignIn(context, email,'apple');
  } catch (e) {
    log('appleSignIn Error : $e');
    return;
  }
}

void googleSignIn(BuildContext context) async {
  try {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account == null) throw Exception('로그인을 실패했습니다');
    if (!context.mounted) return;
    socialSignIn(context, account.email,'google');
  } catch (e) {
    log('googleSignIn Error : $e');
    return;
  }
}

void socialSignIn(BuildContext context, String email,String social) async {
  bool isSignedEmail = await SignService.isSignedUser(email);
  if (!context.mounted) return;
  if (!isSignedEmail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpNameScreen(
          email: email,
          password: social,
        ),
      ),
    );
    return;
  }
  model_user.User?  user = await SignService.socialSignIn(email,social);
  if(user==null || !context.mounted) return;
  context.read<UserController>().signIn(user);
  LocalService.saveUserData(user);
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
      (route) => false);
}

String getNewCertificationNumber() {
  String newCertificationNumber = '';
  for (int i = 0; i < 6; i++) {
    newCertificationNumber += math.Random().nextInt(10).toString();
  }
  return newCertificationNumber;
}


String? getSocialImage(String social){
  switch(social){
    case 'kakao':
      return 'assets/logo/social/kakao.png';
    case 'apple':
      return 'assets/logo/social/apple.png';
    case 'naver':
      return 'assets/logo/social/naver.png';
    case 'google':
      return 'assets/logo/social/google.png';
    default:
      return null;
  }

}