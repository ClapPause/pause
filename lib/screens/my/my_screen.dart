import 'package:flutter/material.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/screens/my/setting_screen.dart';
import 'package:pause/utils/sign_in_utils.dart';
import 'package:provider/provider.dart';
import '../../constants/constants_color.dart';
import '../sign/login_screen.dart';
import 'components/service_container.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.centerRight,
            width: 40,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF8A8A8A),
            ),
          ),
        ),
        leadingWidth: 40,
        surfaceTintColor: kWhiteColor,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingScreen(),
              ),
            ),
            child: const Icon(
              Icons.settings,
              color: Color(0xFF8A8A8A),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Consumer<UserController>(builder: (context, controller, child) {
        if (controller.user == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        }
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xFFD9D9D9),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: const Color(0xFFFFECE4),
                ),
                child: Image.asset('assets/image/my_page_pausy.png'),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${controller.user!.name}님',
              style: TextStyle(
                fontSize: 14,
                height: 20 / 14,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  String? image = getSocialImage(controller.user!.password);
                  if (image == null) return Container();
                  return Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 16,
                    height: 16,
                    child: Image.asset(image),
                  );
                }),
                Text(
                  controller.user!.email,
                  style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: const Color(0xFF8A8A8A).withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 10,
              color: const Color(0xFFEFF0F2),
            ),
            const SizedBox(height: 24),
            // 이용가이드
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 16),
            //   padding: const EdgeInsets.all(16),
            //   width: double.infinity,
            //   height: 80,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(color: kBlack100),
            //   ),
            //   child: Row(
            //     children: [
            //       Container(
            //           alignment: Alignment.center,
            //           width: 40,
            //           height: 40,
            //           decoration: BoxDecoration(
            //               color: kPrimaryColor,
            //               borderRadius: BorderRadius.circular(40),
            //               boxShadow: [
            //                 BoxShadow(
            //                   offset: const Offset(0, 2),
            //                   blurRadius: 2,
            //                   color: kBlackColor.withOpacity(0.25),
            //                 )
            //               ]),
            //           child: Text(
            //             'Guide',
            //             style: TextStyle(
            //               color: kWhiteColor,
            //               fontSize: 12,
            //               height: 16 / 12,
            //               letterSpacing: -0.3,
            //             ),
            //           )),
            //       const SizedBox(width: 16),
            //       Expanded(
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               '퍼지와 함께하는',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 height: 16 / 12,
            //                 color: kBlackColor,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Text(
            //               '이용가이드',
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 height: 20 / 16,
            //                 color: kPrimaryColor,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       const Icon(
            //         Icons.arrow_forward_ios,
            //         color: Color(0xFFBCBCBC),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 30),
            const Row(
              children: [
                SizedBox(width: 30),
                Text(
                  '서비스 안내',
                  style: TextStyle(
                    fontSize: 12,
                    height: 20 / 12,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ServiceContainer(onTap: () {}, text: '문의하기'),
            const SizedBox(height: 20),
            ServiceContainer(onTap: () {}, text: '서비스 이용 약관'),
            const SizedBox(height: 20),
            ServiceContainer(onTap: () {}, text: '개인정보처리방침'),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset('assets/image/main_home.png'),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: const BottomAppBar().height,
        child: BottomAppBar(
          height: 20,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: const Color(0xFFFFECE4),
          surfaceTintColor: kWhiteColor,
        ),
      ),
    );
  }
}
