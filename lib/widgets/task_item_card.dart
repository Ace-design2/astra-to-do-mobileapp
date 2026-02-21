import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItemCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskItemCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F0F), // Very dark card background
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.03), width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCheckbox(),
            const SizedBox(width: 16),
            Expanded(child: _buildTaskDetails()),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(top: 2), // Align visually with text
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: task.isCompleted
            ? const Color(0xFF1B5E20) // Dark green fill
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFF4CAF50), // Green border
          width: 2,
        ),
      ),
      child: task.isCompleted
          ? const Icon(
              Icons.check,
              size: 16,
              color: Color(0xFF81C784), // Lighter green check
            )
          : null,
    );
  }

  Widget _buildTaskDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            height: 1.4,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted
                ? Colors.white.withValues(alpha: 0.3)
                : Colors.white,
            fontWeight: task.isCompleted ? FontWeight.w400 : FontWeight.w500,
          ),
        ),
        if (task.aiTag != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text(
                  task.aiTag!.split('•')[0].trim(), // "All Day"
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                if (task.aiTag!.contains('•')) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                  Text(
                    task.aiTag!.split('•')[1].trim(), // "HIGH"
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50), // Green
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
