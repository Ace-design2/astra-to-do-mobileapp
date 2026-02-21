import 'package:flutter/cupertino.dart';
import 'home_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.black.withValues(
          alpha: 0.8,
        ), // Frosted glass effect base
        activeColor: CupertinoTheme.of(context).primaryColor,
        inactiveColor: CupertinoColors.systemGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.sun_max_fill),
            label: 'My Day',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_square),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_solid),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const HomeScreen();
              case 1:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(middle: Text('Chat')),
                  child: Center(child: Text('Chat')),
                );
              case 2:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Insights'),
                  ),
                  child: Center(child: Text('Insights')),
                );
              case 3:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Calendar'),
                  ),
                  child: Center(child: Text('Calendar')),
                );
              case 4:
                return const CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Profile'),
                  ),
                  child: Center(child: Text('Profile')),
                );
              default:
                return const HomeScreen();
            }
          },
        );
      },
    );
  }
}
