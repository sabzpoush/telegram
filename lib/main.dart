import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_interactive/new_mesasage_page.dart';
import 'body_page.dart';
import 'drawer.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  void dispose() {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MainApp',
      theme: ThemeData(
        canvasColor: Colors.grey[900],
      ),
      initialRoute: '/first',
      routes: {
        '/first': (context) => const FirstPage(),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

bool isIcon = true;

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey[850],
        centerTitle: false,
        title: const Text(
          'Telegram',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NewMessagePage(),
            ),
          );
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      drawer: const DrawerApp(),
      body: const BodyPage(),
    );
  }
}

class RandomClock {
  static List<String> time = <String>[
    'AM',
    "PM",
  ];
  static String pickTime() {
    time.shuffle();
    return time[0];
  }

  static Random random = Random();
  static String randomTime([int maxNum = 24]) {
    int hour = random.nextInt(maxNum);
    int mins = random.nextInt(60);
    String minuts = '';
    if (mins < 10) {
      minuts = '0$mins';
    } else {
      minuts = mins.toString();
    }
    return "$hour:$minuts ${pickTime()}";
  }
}

class ProfileColor {
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
