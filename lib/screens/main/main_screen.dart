import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pause/screens/home/home_screen.dart';
import '../../constants/constants_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Widget getScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Center(child: Text('page2'));
      case 2:
        return const Center(child: Text('page3'));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 20,
        leading: SizedBox(
          width: 22,
          height: 22,
          child: SvgPicture.asset(
            'assets/icon/statistics.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Image.asset(
            'assets/logo/pause_logo.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            width: 24,
            height: 25,
            child: Image.asset(
              'assets/icon/my_page.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: kWhiteColor,
      body: getScreen(),
      bottomNavigationBar: Container(
        color: kWhiteColor,
        child: SafeArea(
          child: Container(
            color: kWhiteColor,
            width: double.infinity,
            height: 68,
            child: Row(
              children: [
                kBottomNavigationBarItem(
                  activeImage: 'assets/icon/1_active.svg',
                  inactiveImage: 'assets/icon/1_inactive.svg',
                  index: 0,
                ),
                kBottomNavigationBarItem(
                  activeImage: 'assets/icon/2_active.svg',
                  inactiveImage: 'assets/icon/2_inactive.svg',
                  index: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget kBottomNavigationBarItem(
      {required String activeImage,
      required String inactiveImage,
      required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: Container(
          color: kWhiteColor,
          child: SvgPicture.asset(
            _currentIndex == index ? activeImage : inactiveImage,
          ),
        ),
      ),
    );
  }
}
