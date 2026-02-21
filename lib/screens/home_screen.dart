import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_item_card.dart';
import '../widgets/daily_progress_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    // Replacing mock data temporarily to match design requirements
    _tasks = [
      Task(
        id: '1',
        title:
            'Study: Multiple Courses - CSC446: Introduction to Computer Networks (Part 2)',
        dateTime: DateTime.now(),
        isCompleted: false,
        aiTag: 'All Day • HIGH',
      ),
      Task(
        id: '2',
        title:
            'Study: Multiple Courses - CSC444: Introduction to Net-Centric Computing (Part 2)',
        dateTime: DateTime.now(),
        isCompleted: false,
        aiTag: 'All Day • HIGH',
      ),
      Task(
        id: '3',
        title:
            'Study: Multiple Courses - CSC416: Security Principles and Models (Part 1)',
        dateTime: DateTime.now(),
        isCompleted: false,
        aiTag: 'All Day • HIGH',
      ),
      Task(
        id: '4',
        title: 'Study: Multiple Courses - CSC448: Data Communications',
        dateTime: DateTime.now(),
        isCompleted: false,
        aiTag: 'All Day • HIGH',
      ),
    ];
  }

  void _toggleTaskCompletion(String id) {
    setState(() {
      final taskIndex = _tasks.indexWhere((t) => t.id == id);
      if (taskIndex != -1) {
        final task = _tasks[taskIndex];
        _tasks[taskIndex] = task.copyWith(isCompleted: !task.isCompleted);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Force pure dark background as per design
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 120,
          ), // Padding for the bottom navigation bar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                child: DailyProgressCard(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Your Tasks',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTaskList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?img=11', // Placeholder matching the avatar style roughly
            ),
            backgroundColor: Colors.grey[800],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good Evening,\nAce',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    color: Color(0xFFEF5350), // Red accent color for greeting
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Let's make today productive.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1E1E1E), // Dark grey button
            ),
            child: const Icon(
              Icons
                  .notifications_outlined, // Standard material notification bell
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: TaskItemCard(
            key: ValueKey(task.id),
            task: task,
            onTap: () => _toggleTaskCompletion(task.id),
          ),
        );
      },
    );
  }
}
