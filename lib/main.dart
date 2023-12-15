import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  int count = 0;
  List<String> emojies = [
    'angel',
    'crazy',
    'cry',
    'laugh',
    'love',
    'luck',
    'naraz',
    'naughty',
    'smart',
    'thinking'
  ];
  List<Widget> bodyElements = [];
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emoji Adder',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'EMOJI GAME',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: check ? Colors.amber : Colors.red,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Center(
                    child: Text(
                  'Point:${count}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          body: check
              ? Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 65,
                  runSpacing: 60,
                  children: bodyElements,
                )
              : const Wrap(
                  spacing: 43,
                  runSpacing: 40,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                          child: Text(
                        'GAME OVER DUDE',
                        style: TextStyle(
                            backgroundColor: Colors.red,
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )),
                    )
                  ],
                ),
          floatingActionButton: SizedBox(
            height: 130,
            width: 130,
            child: FittedBox(
              child: FloatingActionButton.extended(
                backgroundColor: check ? Colors.amber : Colors.red,
                onPressed: () {
                  setState(() {
                    counter = Random().nextInt(10);
                    count++;
                    if (bodyElements.length != 12) {
                      bodyElements.add(Image.asset(
                        'assets/images/${emojies[counter]}.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 70,
                      ));
                      check = true;
                    } else {
                      count = 0;
                      bodyElements.clear();
                      check = false;
                    }
                  });
                },
                label: Text(check ? 'Add' : 'Restart'),
                icon: Icon(check
                    ? Icons.emoji_emotions_outlined
                    : Icons.restart_alt_outlined),
              ),
            ),
          ),
        ));
  }
}
