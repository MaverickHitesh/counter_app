import 'package:flutter/material.dart';
import 'dart:math';

class HomeCounterScreen extends StatefulWidget {
  const HomeCounterScreen({super.key});

  @override
  State<HomeCounterScreen> createState() => _HomeCounterScreenState();
}

class _HomeCounterScreenState extends State<HomeCounterScreen> {
  var bgColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );
  var fontSize = 12.0;
  var emoji = '😀';
  late Widget shape;

  @override
  void initState() {
    super.initState();
    shape = getRandomShape();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter++',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'MozillaHeadline',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bgColor = Color.fromARGB(
                      255,
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                    );
                  });
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // centers Row horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Tap to change Background color of view',
                        style: TextStyle(
                          fontFamily: 'MozillaHeadline',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    fontSize = Random().nextDouble() * 30 + 10;
                  });
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // centers Row horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Tap to change font size',
                        style: TextStyle(
                          fontFamily: 'MozillaHeadline',
                          fontSize: fontSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    emoji = getRandomEmoji();
                  });
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // centers Row horizontally
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.cyan,
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Tap to get emoji $emoji',
                        style: TextStyle(
                          fontFamily: 'MozillaHeadline',
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    shape = getRandomShape();
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    shape,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final List<String> emojis = [
    "😀",
    "😂",
    "🥳",
    "😍",
    "😎",
    "🤔",
    "😴",
    "🥶",
    "🤯",
    "🤩",
    "🙃",
    "😡",
    "😭",
    "👻",
    "🤖",
  ];

  String getRandomEmoji() {
    final random = Random();
    return emojis[random.nextInt(emojis.length)];
  }

  Widget getRandomShape() {
    Random random = Random();
    int choice = random.nextInt(3);

    final color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    switch (choice) {
      case 0: // Square
        return Container(width: 120, height: 120, color: color);

      case 1: // Circle
        return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        );

      case 2: // Rounded corner
        return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
        );

      default:
        return SizedBox();
    }
  }
}
