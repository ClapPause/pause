import 'package:flutter/material.dart';
import 'package:pause/constants/constants_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function textChanged;
  final int? maxLength;
  final TextInputType? inputType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textChanged,
    this.maxLength,
    this.inputType,
    this.obscureText = false,
    required void Function() showClicked,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kTextFieldBorderColor,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText && !_showPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
          counterText: '',
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: kTextFieldHintColor,
            height: 20 / 16,
          ),
          suffix: widget.obscureText
              ? GestureDetector(
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
                      fontSize: 16,
                      height: 20 / 16,
                    ),
                  ),
                )
              : null,
        ),
        onChanged: (text) => widget.textChanged(text),
        style: TextStyle(
          fontSize: 16,
          color: kBlack300,
          height: 20 / 16,
        ),
      ),
    );
  }
}
