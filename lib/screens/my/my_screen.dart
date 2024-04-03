import 'package:flutter/material.dart';
import 'package:pause/widgets/pause_app_bar.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PauseAppBar(),
    );
  }
}
