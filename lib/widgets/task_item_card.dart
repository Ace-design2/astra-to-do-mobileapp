import 'package:flutter/cupertino.dart';
import '../models/task.dart';

class TaskItemCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskItemCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemGroupedBackground.resolveFrom(
          context,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCheckbox(context),
            const SizedBox(width: 16),
            Expanded(child: _buildTaskDetails(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: task.isCompleted
            ? CupertinoTheme.of(context).primaryColor
            : CupertinoColors.transparent,
        border: Border.all(
          color: task.isCompleted
              ? CupertinoTheme.of(context).primaryColor
              : CupertinoColors.tertiaryLabel.resolveFrom(context),
          width: 1.5,
        ),
      ),
      child: task.isCompleted
          ? const Icon(
              CupertinoIcons.check_mark,
              size: 20,
              color: CupertinoColors.white,
            )
          : null,
    );
  }

  Widget _buildTaskDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            height: 1.3,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted
                ? CupertinoColors.tertiaryLabel.resolveFrom(context)
                : CupertinoColors.label.resolveFrom(context),
          ),
        ),
        if (task.aiTag != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              children: [
                Text(
                  task.aiTag!.split('•')[0].trim(), // "All Day"
                  style: TextStyle(
                    fontSize: 13,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                if (task.aiTag!.contains('•')) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    task.aiTag!.split('•')[1].trim(), // "HIGH"
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGreen.resolveFrom(context),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
