import 'package:flutter/material.dart';
import 'package:pause/models/main_goal/main_goal.dart';
import 'package:pause/models/sub_goal/sub_goal.dart';
import 'package:pause/screens/home/components/weekly_sub_goal_container.dart';

import '../../../services/sub_goal_service.dart';
import '../../../utils/color_utils.dart';

class WeeklyMainGoalContainer extends StatefulWidget {
  final MainGoal mainGoal;

  const WeeklyMainGoalContainer({Key? key, required this.mainGoal})
      : super(key: key);

  @override
  State<WeeklyMainGoalContainer> createState() =>
      _WeeklyMainGoalContainerState();
}

class _WeeklyMainGoalContainerState extends State<WeeklyMainGoalContainer> {
  bool _showMore = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                '# ${widget.mainGoal.goal}',
                style: TextStyle(
                  fontSize: 16,
                  color: getColor(widget.mainGoal.selectColor),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 14),
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
        const SizedBox(height: 20),
        if (_showMore)
          FutureBuilder(
              future: SubGoalService.getSubGoalList(1, widget.mainGoal.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SubGoal>? subGoalList = snapshot.data;
                  if (subGoalList == null || subGoalList.isEmpty) {
                    return Container();
                  }
                  return ListView(
                    padding: const EdgeInsets.only(bottom: 12),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: subGoalList
                        .map((goal) => WeeklySubGoalContainer(
                            mainGoal: widget.mainGoal, subGoal: goal))
                        .toList(),
                  );
                }
                return Container();
              }),
      ],
    );
  }
}
