import 'package:flutter/material.dart';
import 'package:pause/models/main_goal/main_goal.dart';
import 'package:pause/models/sub_goal/sub_goal.dart';
import 'package:pause/models/task/task.dart';
import 'package:pause/screens/home/components/weekly_task_container.dart';
import 'package:pause/services/task_service.dart';

import '../../../utils/color_utils.dart';

class WeeklySubGoalContainer extends StatefulWidget {
  final MainGoal mainGoal;
  final SubGoal subGoal;

  const WeeklySubGoalContainer(
      {Key? key, required this.mainGoal, required this.subGoal})
      : super(key: key);

  @override
  State<WeeklySubGoalContainer> createState() => _WeeklySubGoalContainerState();
}

class _WeeklySubGoalContainerState extends State<WeeklySubGoalContainer> {
  bool _showMore = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: getColor(widget.mainGoal.backgroundColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "D-123 ${widget.subGoal.goal}",
                style: TextStyle(
                  color: getColor(widget.mainGoal.selectColor),
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _showMore = !_showMore),
                behavior: HitTestBehavior.opaque,
                child: Icon(
                  _showMore ? Icons.expand_less : Icons.expand_more,
                  color: getColor(widget.mainGoal.selectColor),
                ),
              ),
            ],
          ),
        ),
        if (_showMore)
          FutureBuilder(
              future: TaskService.getTaskList(
                  1, widget.mainGoal.id, widget.subGoal.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Task>? taskList = snapshot.data;
                  if (taskList == null || taskList.isEmpty) return Container();
                  return ListView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: taskList
                        .map((task) => WeeklyTaskContainer(
                            mainGoal: widget.mainGoal, task: task))
                        .toList(),
                  );
                }
                return Container();
              }),
      ],
    );
  }
}
