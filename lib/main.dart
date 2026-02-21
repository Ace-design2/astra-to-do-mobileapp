import 'package:flutter/cupertino.dart';

import 'screens/main_layout.dart';

void main() {
  runApp(const AstraToDoApp());
}

class AstraToDoApp extends StatelessWidget {
  const AstraToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a premium red accent color
    const Color accentRed = Color(0xFFC1121F);

    return CupertinoApp(
      title: 'Astra To-Do',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: accentRed,
        scaffoldBackgroundColor: CupertinoColors.black,
        barBackgroundColor: Color(
          0xCC1E1E1E,
        ), // Slightly transparent dark for frosted effect
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
          navLargeTitleTextStyle: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.0,
            color: CupertinoColors.white,
          ),
          navTitleTextStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.white,
          ),
        ),
      ),
      home: const MainLayout(),
    );
  }
}
