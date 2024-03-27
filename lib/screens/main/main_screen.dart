import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:provider/provider.dart';
import '../../constants/constants_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  bool _showBottomBar = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _rotateAnimation =
        Tween(begin: 0.0, end: 0.125).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      return Stack(
        children: [
          Scaffold(
            backgroundColor: kWhiteColor,
            appBar: AppBar(
              leading: Container(
                width: 40,
              ),
              leadingWidth: 40,
              backgroundColor: kWhiteColor,
              foregroundColor: kPrimaryColor,
              centerTitle: true,
              title: Image.asset('assets/logo/pause_logo.png'),
              actions: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/image/main_mypage.png'),
                ),
                const SizedBox(width: 10),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image/paper_texture.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    // 명언 부분
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 80,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '"천천히 가도 괜찮아\n나를 잃지만 않으면 돼."',
                            style: TextStyle(
                              fontSize: 24,
                              height: 40 / 24,
                              fontStyle: FontStyle.italic,
                              color: kBlack400,
                            ),
                          ),
                          Text(
                            'from. 곰돌이 푸',
                            style: TextStyle(
                              fontSize: 12,
                              height: 40 / 12,
                              color: kBlack400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 메모
                    Positioned(
                      left: 58,
                      top: 300,
                      child: SizedBox(
                        width: 37,
                        height: 46,
                        child: Image.asset('assets/image/main_note_1.png'),
                      ),
                    ),
                    // 달력
                    Positioned(
                      left: 100,
                      top: 270,
                      child: SizedBox(
                        width: 42,
                        height: 45,
                        child: Image.asset('assets/image/main_note_2.png'),
                      ),
                    ),
                    // 퍼지
                    Positioned(
                      left: 55,
                      top: 360,
                      child: SizedBox(
                        width: 163,
                        height: 211,
                        child: Image.asset('assets/image/main_pausy.png'),
                      ),
                    ),
                    // 책장
                    Positioned(
                      right: 0,
                      top: 334,
                      child: SizedBox(
                        width: 121,
                        height: 181,
                        child: Image.asset('assets/image/main_bookcase.png'),
                      ),
                    ),
                    // 바람이
                    Positioned(
                      right: 55,
                      top: 480,
                      child: SizedBox(
                        width: 102,
                        height: 92,
                        child: Image.asset('assets/image/main_barame.png'),
                      ),
                    ),
                  ],
                ),
                if (_showBottomBar)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                      }
                      setState(() => _showBottomBar = !_showBottomBar);
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              kBottomIcon(
                                icon: 'assets/icon/main_career.svg',
                                onTap: () {},
                              ),
                              const SizedBox(width: 20),
                              kBottomIcon(
                                icon: 'assets/icon/main_history.svg',
                                onTap: () {},
                              ),
                              const SizedBox(width: 20),
                              kBottomIcon(
                                icon: 'assets/icon/main_test.svg',
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButton: GestureDetector(
              onTap: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
                setState(() => _showBottomBar = !_showBottomBar);
              },
              child: RotationTransition(
                turns: _rotateAnimation,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('assets/icon/main_add.svg'),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: const BottomAppBar().height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image/paper_texture.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: BottomAppBar(
                height: 20,
                shape: const CircularNotchedRectangle(),
                notchMargin: 8,
                color: kPrimaryBackgroundColor,
                surfaceTintColor: kWhiteColor,
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget kBottomIcon({
    required String icon,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            color: kBlackColor.withOpacity(0.25),
            blurRadius: 2,
          )
        ]),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
