import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../constants/constants_color.dart';
import '../constants/constants_reg.dart';

void showMessage(BuildContext context, {required String message}) async {
  try {
    Flushbar(
      backgroundColor: kFlushBarBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 14,
        ),
      ),
      duration: const Duration(seconds: 2),
    ).show(context);
  } catch (e) {
    log('showMessage error : $e');
  }
}

String getPhone(String inputPhone){
  RegExp reg = RegExp('-([0-9]{3,4})-');
  int size = reg.firstMatch(inputPhone).toString().length;
  String result = inputPhone.replaceAll(RegExp('-([0-9]{3,4})-'), "-***${size>3?"*":""}-");
  return result;
}

String getDate(String inputDate){
  return "${inputDate.substring(0,4)}.**.**";
}