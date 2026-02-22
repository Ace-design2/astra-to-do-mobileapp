import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import '../widgets/custom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: _currentIndex,
          children: [
            CupertinoTabView(builder: (context) => const HomeScreen()),
            CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text('Chat')),
                child: Center(child: Text('Chat')),
              ),
            ),
            CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text('Insights')),
                child: Center(child: Text('Insights')),
              ),
            ),
            CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text('Calendar')),
                child: Center(child: Text('Calendar')),
              ),
            ),
            CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text('Profile')),
                child: Center(child: Text('Profile')),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Center(
            child: CustomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
