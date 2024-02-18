import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';
import 'package:pause/screens/home/components/life_goal_container.dart';
import 'package:pause/screens/home/main_goal_weekly_page.dart';
import 'components/home_goal_tab_bar.dart';
import 'main_goal_monthly_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  Widget _getPage() {
    if (_pageIndex == 0) {
      return const MainGoalWeeklyPage();
    }
    return const MainGoalMonthlyPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          const LifeGoalContainer(),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              '목표 도달을 위한 실천',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          HomeGoalTabBar(
            currentIndex: _pageIndex,
            onTap: (int index) => setState(() => _pageIndex = index),
          ),
          const SizedBox(height: 24),
          _getPage(),
        ],
      ),
    );
  }
}
