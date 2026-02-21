import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Chat'))),
    const Scaffold(body: Center(child: Text('Insights'))),
    const Scaffold(body: Center(child: Text('Calendar'))),
    const Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: _screens),
          Positioned(
            bottom: 30, // Adjust this value to raise or lower the bar
            left: 20,
            right: 20,
            child: _buildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(
              0xFF1E1E1E,
            ).withValues(alpha: 0.9), // Dark grey frosted background
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                0,
                PhosphorIcons.sun(PhosphorIconsStyle.fill),
                'My Day',
                true,
              ),
              _buildNavItem(1, PhosphorIcons.chatTeardropText(), 'Chat', false),
              _buildNavItem(2, PhosphorIcons.chartBar(), 'Insights', false),
              _buildNavItem(
                3,
                PhosphorIcons.calendarBlank(),
                'Calendar',
                false,
              ),
              _buildNavItem(4, PhosphorIcons.user(), 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData iconData,
    String label,
    bool isSpecial,
  ) {
    final isSelected = _currentIndex == index;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected && !isSpecial
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.transparent,
              boxShadow: isSpecial && isSelected
                  ? [
                      BoxShadow(
                        color: primaryColor.withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              iconData,
              size: 26,
              color: isSpecial
                  ? primaryColor
                  : (isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6)),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSpecial
                  ? primaryColor
                  : (isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
