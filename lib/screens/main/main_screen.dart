import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/question/question.dart';
import 'package:pause/screens/history/history_screen.dart';
import 'package:pause/screens/main/components/go_answer_container.dart';
import 'package:pause/screens/main/components/question_container.dart';
import 'package:pause/screens/main/components/quotes_container.dart';
import 'package:pause/screens/sign/login_screen.dart';
import 'package:pause/services/question_service.dart';
import 'package:pause/widgets/pause_app_bar.dart';
import 'package:provider/provider.dart';
import '../../constants/constants_color.dart';
import '../../utils/question_utils.dart';
import 'components/bottom_bar.dart';
import '../../widgets/question_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<double> _rotateAnimation;
  bool _showBottomBar = false;
  bool _showQuestion = false;
  bool _showQuestionSheet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //       duration: const Duration(milliseconds: 100), vsync: this);
  //   _rotateAnimation =
  //       Tween(begin: 0.0, end: 0.125).animate(_animationController);
  // }

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
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kWhiteColor,
        appBar: const PauseAppBar(),
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
                  GoAnswerContainer(
                    onTap: () => setState(() {
                      _showQuestionSheet = true;
                    }),
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
                              !isDifferentDate(lastQuestion.openTimeStamp)) {
                            // 질문 기록하기 화면으로 가기
                            // 이전에 질문 답변 안하고 재접속한 경우를 생각하면 될듯
                            // 질문 보여주기
                            return QuestionContainer(
                              onTap: () => setState(
                                () => _showQuestionSheet = true,
                              ),
                              question: lastQuestion,
                            );
                          }
                          return const QuotesContainer();
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
                                child:
                                    Image.asset('assets/image/main_mail.png'),
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
            if (_showQuestionSheet)
              FutureBuilder(
                  future: QuestionService.getLastQuestionByUid(
                      uid: controller.user!.id),
                  builder: (context, snapshot) {
                    Question? question = snapshot.data;
                    if (question == null) return Container();
                    return QuestionSheet(
                      onTap: () => setState(() {
                        _showQuestionSheet = !_showQuestionSheet;
                        if (_showQuestion) {
                          _showQuestion = false;
                        }
                      }),
                      question: question,
                    );
                  }),
            if (_showBottomBar)
              BottomBar(onTap: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                }
                setState(() => _showBottomBar = !_showBottomBar);
              }),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(60),
            ),
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              'assets/icon/history.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        // floatingActionButton: GestureDetector(
        //   onTap: () {
        //     if (_animationController.isCompleted) {
        //       _animationController.reverse();
        //     } else {
        //       _animationController.forward();
        //     }
        //     setState(() => _showBottomBar = !_showBottomBar);
        //   },
        //   child: RotationTransition(
        //     turns: _rotateAnimation,
        //     child: SizedBox(
        //       width: 60,
        //       height: 60,
        //       child: Image.asset('assets/image/main_add.png'),
        //     ),
        //   ),
        // ),
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
            color: const Color(0xFFFFECE4),
            surfaceTintColor: kWhiteColor,
          ),
        ),
      );
    });
  }
}
