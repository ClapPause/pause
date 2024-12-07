import 'package:flutter/material.dart';
import 'package:pause/constants/constants_reg.dart';
import 'package:pause/controllers/user_controller.dart';
import 'package:pause/models/information/information.dart';
import 'package:pause/services/information_service.dart';
import 'package:pause/utils/local_utils.dart';
import 'package:pause/widgets/custom_action_button.dart';
import 'package:provider/provider.dart';

import '../../constants/constants_color.dart';
import '../../models/user/user.dart';
import '../main/main_screen.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  String _gender = "";

  @override
  void initState() {
    super.initState();
    setUp();
  }

  void setUp() async {
    if (context.read<UserController>().user == null) return;
    Information? information = await InformationService.getInformation(
        context.read<UserController>().user!.id);
    if (information == null) return;
    setState(() {
      _nameController.text = information.name;
      _phoneController.text = information.phone.replaceAll("-", "");
      _birthController.text = information.birthday;
      _jobController.text = information.job;
      _gender = information.gender;
    });
  }

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
          '회원정보 수정',
          style: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false),
            child: const Icon(
              Icons.home_outlined,
              color: Color(0xFF8A8A8A),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFFD9D9D9),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(height: 40),
                const Text(
                  '회원정보 입력',
                  style: TextStyle(
                    fontSize: 28,
                    height: 30 / 28,
                    color: Color(0xFF414141),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '특수문자 사용 금지',
                  style: TextStyle(
                    fontSize: 16,
                    height: 20 / 16,
                    color: Color(0xFF6A6868),
                  ),
                ),
                const SizedBox(height: 36),
                getInputContainer(
                  title: "이름",
                  controller: _nameController,
                  hintText: "홍길동",
                  inputType: TextInputType.name,
                  showIsChecked: true,
                  isChecked: kNickNameRegExp.hasMatch(_nameController.text),
                ),
                const SizedBox(height: 28),
                getInputContainer(
                  title: "휴대폰 번호",
                  controller: _phoneController,
                  hintText: "010-1234-1234",
                  inputType: TextInputType.number,
                  showIsChecked: true,
                  isChecked: kPhoneRegExp.hasMatch(_phoneController.text),
                  maxLength: 11,
                ),
                const SizedBox(height: 28),
                getInputContainer(
                  title: "생년월일",
                  controller: _birthController,
                  hintText: "2000.01.01",
                  inputType: TextInputType.number,
                  showIsChecked: true,
                  isChecked: kBirthRegExp.hasMatch(_birthController.text),
                  maxLength: 8,
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    getGenderContainer("남성"),
                    const SizedBox(width: 10),
                    getGenderContainer("여성"),
                  ],
                ),
                const SizedBox(height: 28),
                getInputContainer(
                  title: "직업",
                  controller: _jobController,
                  hintText: "예) 대학생",
                  inputType: TextInputType.text,
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomActionButton(
                text: '수정하기',
                onTap: () async {
                  if (context.read<UserController>().user == null) return;
                  User user = context.read<UserController>().user!;
                  Information? information =
                      await InformationService.getInformation(user.id);
                  if (_nameController.text.isEmpty) {
                    showMessage(context, message: "이름이 비어있으면 안돼요!");
                    return;
                  }
                  if (_phoneController.text.isEmpty) {
                    showMessage(context, message: "휴대폰 번호가 비어있으면 안돼요!");
                    return;
                  }
                  if (_birthController.text.isEmpty) {
                    showMessage(context, message: "생년월일이 비어있으면 안돼요!");
                    return;
                  }
                  if (_gender.isEmpty) {
                    showMessage(context, message: "성별이 비어있으면 안돼요!");
                    return;
                  }
                  if (_jobController.text.isEmpty) {
                    showMessage(context, message: "직업이 비어있으면 안돼요!");
                    return;
                  }
                  String text = _phoneController.text;
                  String phone =
                      "${text.substring(0, 3)}-${text.substring(3, text.length - 4)}-${text.substring(text.length - 4)}";

                  if (information == null) {
                    await InformationService.uploadInformation(
                      user.id,
                      {
                        'name': _nameController.text,
                        'phone': phone,
                        'birthday': _birthController.text,
                        'job': _jobController.text,
                        'gender': _gender,
                      },
                    );
                  } else {
                    Information updateInformation = Information(
                      id: information.id,
                      uid: information.uid,
                      name: _nameController.text,
                      phone: phone,
                      birthday: _birthController.text,
                      job: _jobController.text,
                      gender: _gender,
                    );
                    await InformationService.updateInformation(
                        updateInformation);
                  }
                  if (!context.mounted) return;
                  context.read<UserController>().refresh();
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getInputContainer(
      {required String title,
      required String hintText,
      required TextEditingController controller,
      required TextInputType inputType,
      bool showIsChecked = false,
      bool isChecked = false,
      int? maxLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            height: 20 / 16,
            color: Color(0xFF6A6868),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE8E8E8),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: inputType,
                  maxLength: maxLength,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    counterText: '',
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: kTextFieldHintColor,
                      height: 20 / 16,
                    ),
                  ),
                  onChanged: (text) => setState(() {}),
                ),
              ),
              if (showIsChecked)
                Icon(
                  Icons.check,
                  color: isChecked ? kPrimaryColor : const Color(0xFFBDBDBD),
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget getGenderContainer(String gender) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _gender = gender),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: _gender == gender
                    ? kPrimaryColor
                    : const Color(0xFFD9D9D9)),
          ),
          child: Text(
            gender,
            style: TextStyle(
              fontSize: 14,
              height: 16 / 14,
              color: _gender == gender ? kPrimaryColor : kBlack300,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
