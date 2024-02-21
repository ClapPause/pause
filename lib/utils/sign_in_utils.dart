import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../screens/sign/social_login_result_screen.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SocialLoginResultScreen(
          social: 'kakao',
          email: userEmail,
        ),
      ),
    );
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SocialLoginResultScreen(
          social: 'apple',
          email: email,
        ),
      ),
    );
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SocialLoginResultScreen(
          social: 'google',
          email: account.email,
        ),
      ),
    );
  } catch (e) {
    log('googleSignIn Error : $e');
    return;
  }
}
