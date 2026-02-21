class Task {
  final String id;
  final String title;
  final DateTime dateTime;
  final bool isCompleted;
  final String? aiTag; // Optional tag like "Generated", "Priority", etc.

  Task({
    required this.id,
    required this.title,
    required this.dateTime,
    this.isCompleted = false,
    this.aiTag,
  });

  Task copyWith({
    String? id,
    String? title,
    DateTime? dateTime,
    bool? isCompleted,
    String? aiTag,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      isCompleted: isCompleted ?? this.isCompleted,
      aiTag: aiTag ?? this.aiTag,
    );
  }
}

// Mock Data
final List<Task> mockTasks = [
  Task(
    id: '1',
    title: 'Review Flutter architecture plan',
    dateTime: DateTime.now().add(const Duration(hours: 1)),
    isCompleted: false,
    aiTag: 'High Priority',
  ),
  Task(
    id: '2',
    title: 'Buy groceries for the week',
    dateTime: DateTime.now().add(const Duration(hours: 4)),
    isCompleted: false,
  ),
  Task(
    id: '3',
    title: 'Call mom',
    dateTime: DateTime.now().add(const Duration(days: 1)),
    isCompleted: false,
    aiTag: 'Reminder',
  ),
  Task(
    id: '4',
    title: 'Finish UI design implementation',
    dateTime: DateTime.now().subtract(const Duration(hours: 2)),
    isCompleted: true,
  ),
];
