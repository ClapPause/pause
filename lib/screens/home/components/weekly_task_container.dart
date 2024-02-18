import 'package:flutter/material.dart';
import 'package:pause/models/main_goal/main_goal.dart';
import 'package:pause/models/task/task.dart';

import '../../../utils/color_utils.dart';

class WeeklyTaskContainer extends StatefulWidget {
  final MainGoal mainGoal;
  final Task task;

  const WeeklyTaskContainer(
      {Key? key, required this.mainGoal, required this.task})
      : super(key: key);

  @override
  State<WeeklyTaskContainer> createState() => _WeeklyTaskContainerState();
}

class _WeeklyTaskContainerState extends State<WeeklyTaskContainer> {
  late bool _value = widget.task.id.isEven;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 30, bottom: 8),
      padding: const EdgeInsets.only(
        left: 10,
        right: 18,
      ),
      width: double.infinity,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFF999999).withOpacity(0.6)),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 38,
            decoration: BoxDecoration(
              color: getColor(widget.mainGoal.selectColor),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.task.goal,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  '설정',
                  style: TextStyle(
                    color: Color(0xFF425884),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: _value,
            onChanged: (value) => setState(() => _value = value ?? false),
            activeColor: getColor(widget.mainGoal.selectColor),
            side: const BorderSide(
              width: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
