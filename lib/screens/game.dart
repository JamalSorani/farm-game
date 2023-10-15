import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/player.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget with ChangeNotifier {
  GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final myPlayer = Provider.of<Player>(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<List> top = [
      // 0
      [
        0.0,
        height / 13.6,
        2 * height / 13.6,
        3 * height / 13.6,
        4 * height / 13.6,
        5 * height / 13.6,
        6 * height / 13.6,
        7 * height / 12,
      ],
      // 1
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 2
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 3
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 4
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 5
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 6
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 7
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 8
      [
        0.0,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 12,
      ],
      // 9
      [
        0.0,
        height / 13.6,
        2 * height / 13.6,
        3 * height / 13.6,
        4 * height / 13.6,
        5 * height / 13.6,
        6 * height / 13.6,
        7 * height / 12,
      ],
    ];
    List<List> right = [
      // 0
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ],
      // 1
      [
        width / 5.6,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 5.6,
      ],
      // 2
      [
        width / 3.8,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 3.8,
      ],
      // 3
      [
        width / 2.9,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 2.9,
      ],
      // 4
      [
        width / 2.35,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 2.35,
      ],
      // 5
      [
        width / 1.97,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.97,
      ],
      // 6
      [
        width / 1.69,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.69,
      ],
      // 7
      [
        width / 1.49,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.49,
      ],
      // 8
      [
        width / 1.326,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.326,
      ],
      // 9
      [
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
      ],
    ];
    List<List> top1 = [
      // 0
      [
        0.0,
        height / 13.6,
        2 * height / 13.6,
        3 * height / 13.6,
        4 * height / 13.6,
        5 * height / 13.6,
        6 * height / 13.6,
        7 * height / 13.5,
      ],
      // 1
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 2
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 3
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 4
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 5
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 6
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 7
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 8
      [
        -height / 13.6,
        0,
        0,
        0,
        0,
        0,
        0,
        7 * height / 13.5,
      ],
      // 9
      [
        -height / 13.6,
        height / 13.6,
        2 * height / 13.6,
        3 * height / 13.6,
        4 * height / 13.6,
        5 * height / 13.6,
        6 * height / 13.6,
        7 * height / 12,
      ],
    ];
    List<List> right1 = [
      // 0
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        -width / 13,
      ],
      // 1
      [
        width / 10,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 10,
      ],
      // 2
      [
        width / 5.4,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 5.4,
      ],
      // 3
      [
        width / 3.75,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 3.75,
      ],
      // 4
      [
        width / 2.88,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 2.88,
      ],
      // 5
      [
        width / 2.32,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 2.32,
      ],
      // 6
      [
        width / 1.95,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.95,
      ],
      // 7
      [
        width / 1.688,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.688,
      ],
      // 8
      [
        width / 1.478,
        0,
        0,
        0,
        0,
        0,
        0,
        width / 1.478,
      ],
      // 9
      [
        width / 1.288,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
        width / 1.17,
      ],
    ];

    return Builder(builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'هل تريد الخروج؟',
                  textAlign: TextAlign.center,
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('لا'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('نعم'),
                  ),
                ],
              );
            },
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/background.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Consumer<Player>(
                  builder: (context, value, child) => AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.elasticInOut,
                    right: width / 12 + right1[value.i][value.j],
                    top: height / 3.8 + top1[value.i][value.j],
                    child: Image.asset(
                      color: const Color.fromARGB(255, 213, 0, 0),
                      'assets/images/player.png',
                      width: width * 0.05,
                      height: height * 0.05,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
                Consumer<Player>(
                  builder: (context, value, child) => AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.elasticInOut,
                    right: width / 90 + right[value.u][value.v],
                    top: height / 3.8 + top[value.u][value.v],
                    child: Image.asset(
                      color: Colors.black,
                      'assets/images/player.png',
                      width: width * 0.05,
                      height: height * 0.05,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  bottom: height / 4.3,
                  left: width / 2.9,
                  height: height / 8,
                  width: width / 3.1,
                  child: Column(
                    children: [
                      Transform.rotate(
                        angle: Random().nextDouble() * 180,
                        child: Image.asset(
                          myPlayer.images[myPlayer.imgIndex],
                          height: height / 15,
                          width: width / 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      !myPlayer.currentPlayer
                          ? myPlayer.y == 0
                              ? Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 222, 64, 52)),
                                    onPressed: () {
                                      myPlayer.rollingDice();
                                      setState(() {
                                        isPressed = false;
                                      });
                                    },
                                    child: const Text('Play'),
                                  ),
                                )
                              : Expanded(
                                  child: ElevatedButton(
                                    onPressed: isPressed
                                        ? null
                                        : () {
                                            myPlayer.move(myPlayer.y, context,
                                                height, width);
                                            setState(() {
                                              isPressed = true;
                                            });
                                          },
                                    child: const Text('Move'),
                                  ),
                                )
                          : const SizedBox()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'رصيد اللاعب الآخر',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 17, 0)),
                            //    textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.monetization_on_outlined,
                                  color: Color.fromARGB(255, 255, 17, 0)),
                              const SizedBox(
                                width: 2,
                              ),
                              Consumer<Player>(
                                builder: (context, value, child) => Text(
                                  value.money2.toString(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 17, 0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        myPlayer.tentant == 2
                            ? 'لم يستأجر أحد للمزرعة بعد'
                            : myPlayer.tentant == 1
                                ? 'المستأجر هو اللاعب الأول'
                                : 'المستأجر هو اللاعب الثاني',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'رصيدك',
                            style: TextStyle(
                                color: Color.fromARGB(255, 41, 98, 255)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.monetization_on_outlined,
                                color: Color.fromARGB(255, 41, 98, 255),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Consumer<Player>(
                                builder: (context, value, child) => Text(
                                    value.money1.toString(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 41, 98, 255))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Consumer<Player>(
                  builder: (context, value, child) => AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    left: width * 0.01 +
                        value.index2 * width * 0.051 +
                        width * 0.005,
                    top: height / 8.5,
                    child: Image.asset(
                      color: Colors.black,
                      'assets/images/player.png',
                      width: width * 0.05,
                      height: height * 0.05,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
                Consumer<Player>(
                  builder: (context, value, child) => AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    right: width * 0.01 +
                        value.index1 * width * 0.051 +
                        width * 0.005,
                    top: height * 0.91,
                    child: Image.asset(
                      color: const Color.fromARGB(255, 213, 0, 0),
                      'assets/images/player.png',
                      width: width * 0.05,
                      height: height * 0.05,
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
                // FloatingActionButton(onPressed: () {
                //   myPlayer.putindex2(myPlayer.index2 + 1);
                // })
              ],
            ),
          ),
        ),
      );
    });
  }
}
