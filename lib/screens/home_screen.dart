import 'package:flutter/cupertino.dart';
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E0A10), // Deep red/black
            Color(0xFF0A0A1E), // Deep blue/black
            Color(0xFF140510), // Deep purple/black
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.transparent,
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: CupertinoColors.transparent,
              border: null,
              largeTitle: const Text(
                'Good Evening, Ace',
                style: TextStyle(color: CupertinoColors.white),
              ),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.bell,
                  color: CupertinoColors.white,
                ),
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Text(
                  "Let's make today productive.",
                  style: TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.white.withAlpha(180),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DailyProgressCard(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 24.0,
                  bottom: 8.0,
                ),
                child: Text(
                  'YOUR TASKS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white.withAlpha(150),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final task = _tasks[index];
                return TaskItemCard(
                  key: ValueKey(task.id),
                  task: task,
                  onTap: () => _toggleTaskCompletion(task.id),
                );
              }, childCount: _tasks.length),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 100),
            ), // Space for tab bar
          ],
        ),
      ),
    );
  }
}
