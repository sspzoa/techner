import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'dart:io' show Platform;

import 'indexes/homePage.dart';
import 'indexes/profilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent,)
  );

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Techner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: const Color(0xFF303030),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 2);
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -10,
            right: 0,
            child: Image.asset(
              'assets/images/ellipse_top.png',
              height: 550,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/ellipse_bottom.png',
              height: 550,
            ),
          ),
          PageView(
            controller: _pageController,
            children: const [
              Center(child: Text('hello')),
              Center(child: Text('hello')),
              HomePage(),
              ProfilePage(),
              Center(child: Text('hello')),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Platform.isAndroid ? 65 : 85,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Color(0xE5767676),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.brush_rounded,
                        color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        _pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.palette_rounded,
                        color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        _pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.home_rounded,
                        color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        _pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        _pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        _pageController.animateToPage(4,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
