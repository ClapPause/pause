import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/question/question.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/services/question_service.dart';
import 'package:provider/provider.dart';
import '../../constants/constants_color.dart';
import '../../utils/question_utils.dart';

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
  bool _showQuestion = false;

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
                    // 질문 부분
                    if (_showQuestion)
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 80,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => setState(() => _showQuestion = false),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 36),
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF999999).withOpacity(0.6),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 2),
                                  blurRadius: 2,
                                  color: kBlackColor.withOpacity(0.25),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  '오늘의 질문이 왔어요!!',
                                  style: TextStyle(
                                    color: kBlackColor,
                                    height: 16 / 14,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 22),
                                Container(
                                  alignment: Alignment.center,
                                  width: 130,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFA5A5),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    '답변하러 가기',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 16 / 14,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      Positioned(
                          left: 0,
                          right: 0,
                          top: 80,
                          child: FutureBuilder(
                            future: QuestionService.getLastQuestionByUid(
                                uid: controller.user!.id),
                            builder: (context, snapshot) {
                              Question? lastQuestion = snapshot.data;
                              if (lastQuestion != null &&
                                  !isDifferentDate(
                                      lastQuestion.openTimeStamp) && !lastQuestion.answered) {
                                // 질문 기록하기 화면으로 가기
                                // 이전에 질문 답변 안하고 재접속한 경우를 생각하면 될듯
                                // 질문 보여주기
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){
                                    // 여기서 dialog를 보여주거나 혹은
                                    // Stack과 같이 그냥 위에 하나를 새로 보여주거나
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(horizontal: 36),
                                    width: double.infinity,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: const Color(0xFFCC8484),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 5),
                                          blurRadius: 5,
                                          color: kBlackColor.withOpacity(0.25),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 16),
                                        Text(
                                          lastQuestion.question,
                                          style: TextStyle(
                                            color: kBlackColor,
                                            height: 24 / 16,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 22),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFA5A5),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Text(
                                            '기록하기',
                                            style: TextStyle(
                                              fontSize: 14,
                                              height: 16 / 14,
                                              color: kWhiteColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              // TODO 여기서 명언 보여주기
                              return Column(
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
                              );
                            },
                          )),
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
                    // 메일

                    FutureBuilder(
                      future: QuestionService.getLastQuestionByUid(
                          uid: controller.user!.id),
                      builder: (context, snapshot) {
                        Question? lastQuestion = snapshot.data;
                        if (!_showQuestion &&
                            (lastQuestion == null ||
                                isDifferentDate(lastQuestion.openTimeStamp))) {
                          return Positioned(
                            left: 0,
                            right: 0,
                            top: 300,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () async {
                                    if (_showQuestion) return;
                                    _showQuestion = true;
                                    await QuestionService.makeQuestion(
                                        uid: controller.user!.id);
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    width: 54,
                                    height: 34,
                                    child: Image.asset(
                                        'assets/image/main_mail.png'),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '질문이 도착했어요!',
                                  style: TextStyle(
                                    fontSize: 10,
                                    height: 12 / 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFEF626B),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
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
