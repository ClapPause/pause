import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final TextInputType? inputType;
  final bool showObscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength,
    this.inputType,
    this.showObscureText = false,
    required void Function() showClicked,
  });


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 45),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kTextFieldBorderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.inputType,
              maxLength: widget.maxLength,
              obscureText: widget.showObscureText && !_showPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: kTextFieldHintColor,
                  height: 20 / 14,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: kBlack300,
                height: 20 / 14,
              ),
            ),
          ),
          if(widget.showObscureText)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child: Text(
              _showPassword ? 'Hide' : 'Show',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
