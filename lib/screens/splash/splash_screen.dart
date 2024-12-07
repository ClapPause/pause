import 'package:flutter/material.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller.dart';
import '../../models/user/user.dart';
import '../../services/local_service.dart';
import '../../services/sign_service.dart';
import '../main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(milliseconds: 1500));
    bool autoLogin = await LocalService.getUserAutoLogin();
    if (!autoLogin) {
      navigateToLogin();
      return;
    }
    User? user = await LocalService.getUserInfo();
    if (user == null) {
      navigateToLogin();
      return;
    }
    user = await SignService.localSignIn(user.email, user.password);
    if (user == null) {
      navigateToLogin();
      return;
    }
    if (!mounted) return;
    LocalService.saveUserData(user);
    context.read<UserController>().signIn(user);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
      (route) => false,
    );
  }

  void navigateToLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/image/splash.png");
  }
}
