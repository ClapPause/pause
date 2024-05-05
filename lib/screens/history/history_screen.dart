import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/question/question.dart';
import 'package:pause/screens/history/components/locked_question_card.dart';
import 'package:pause/services/question_service.dart';
import 'package:pause/utils/question_utils.dart';
import 'package:provider/provider.dart';

import '../../constants/constants_color.dart';
import '../../widgets/pause_app_bar.dart';
import '../../widgets/question_sheet.dart';
import '../sign/login_screen.dart';
import 'components/question_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _showQuestionSheet = false;
  Question? _selectedQuestion;

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
            StreamBuilder(
                stream: QuestionService.getStreamQuestionByUid(
                    uid: controller.user!.id),
                builder: (context, snapshot) {
                  QuerySnapshot<Map<String, dynamic>>? stream = snapshot.data;
                  if (stream == null) return Container();
                  List<Question> questionList = stream.docs.map((document) {
                    return Question.fromJson(document.data());
                  }).toList();
                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: questionList.map((question) {
                      // TODO 광고 기능을 집어넣으면 광고기능과 함께 기능추가할것
                      // if (!question.answered &&
                      //     isDifferentDate(question.openTimeStamp)) {
                      //   return LockedQuestionCard(question: question);
                      // }
                      return QuestionCard(
                        question: question,
                        onTap: () => setState(() {
                          _showQuestionSheet = !_showQuestionSheet;
                          _selectedQuestion = question;
                        }),
                      );
                    }).toList(),
                  );
                }),
            if (_showQuestionSheet && _selectedQuestion != null)
              QuestionSheet(
                onTap: () => setState(() {
                  _showQuestionSheet = !_showQuestionSheet;
                  _selectedQuestion = null;
                }),
                question: _selectedQuestion!,
              ),
          ],
        ),
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
      );
    });
  }
}
