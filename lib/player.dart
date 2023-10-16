import 'dart:async';
import 'dart:math';

import 'package:farm/main.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class Player with ChangeNotifier {
  //coordinates of first player
  int _i = 0;
  int get i {
    return _i;
  }

  void puti(int i) {
    _i = i;
    notifyListeners();
  }

  int _j = 0;

  int get j {
    return _j;
  }

  void putj(int j) {
    _j = j;
    notifyListeners();
  }

  //coordinates of second player
  int _u = 0;

  int get u {
    return _u;
  }

  void putu(int x) {
    _u = x;
    notifyListeners();
  }

  int _v = 0;

  int get v {
    return _v;
  }

  void putv(int y) {
    _v = y;
    notifyListeners();
  }

  //money of first player
  var _money1 = 300;

  int get money1 {
    return _money1;
  }

  void putmoney1(int x) {
    _money1 = x;
    notifyListeners();
  }

  //money of second player
  int _money2 = 300;

  int get money2 {
    return _money2;
  }

  void putmoney2(int x) {
    _money2 = x;
    notifyListeners();
  }

  //index of first player
  int _index1 = 0;

  int get index1 {
    return _index1;
  }

  void putindex1(int x) {
    _index1 = x;
    notifyListeners();
  }

  //index of second player
  int _index2 = 0;
  int get index2 {
    return _index2;
  }

  void putindex2(int x) {
    _index2 = x;
    notifyListeners();
  }

  void putchanceMoney(int x) {
    _chanceMoney = x;
    notifyListeners();
  }

  //chance money
  int _chanceMoney = 50;
  int get chanceMoney {
    return _chanceMoney;
  }

//imageIndex
  int _imgIndex = 0;
  int get imgIndex {
    return _imgIndex;
  }

  void putimgIndex(int imgIndex) {
    _imgIndex = imgIndex;
    notifyListeners();
  }

//y
  int _y = 0;
  int get y {
    return _y;
  }

  void putY(int y) {
    _y = y;
    notifyListeners();
  }

//y2
  int _y2 = 0;
  int get y2 {
    return _y2;
  }

  void putY2(int y2) {
    _y2 = y2;
    notifyListeners();
  }

//y3
  int _y3 = 0;
  int get y3 {
    return _y3;
  }

  void putY3(int y3) {
    _y3 = y3;
    notifyListeners();
  }

  //currentPlayer
  bool _currentPlayer = false;
  bool get currentPlayer {
    return _currentPlayer;
  }

  void putCurrentPlayer(currentPlayer) {
    _currentPlayer = currentPlayer;
    notifyListeners();
  }

//tentant
  int _tentant = 2;
  int get tentant {
    return _tentant;
  }

  void puttentant(int tentant) {
    _tentant = tentant;
    notifyListeners();
  }

// start function
  void start(BuildContext context) {
    if (!currentPlayer) {
      putmoney1(money1 + 300);
      putCurrentPlayer(!currentPlayer);
      moveSecondPlayer(context);
    } else {
      putmoney2(money2 + 300);
      putCurrentPlayer(!currentPlayer);
    }
  }

  void buy(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.purple[50],
        title: const Text(
          'اشتري السلعة التالية أو خذ مرتبتك من البنك',
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.yellow[500]),
            onPressed: () {
              putmoney1(money1 + products[index1]);

              Navigator.of(context).pop();
            },
            child: const Text('سآخذ مرتبتي'),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.yellow[500]),
            onPressed: () {
              if (money1 < products[index1 + 1]) {
                return;
              } else {
                putindex1(index1 + 1);
                if (index1 == 18) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      elevation: 0,
                      backgroundColor: Colors.purple[50],
                      title: const Text(
                        '.مبروك لقد ربحت',
                        textAlign: TextAlign.center,
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((MyApp) => false);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ),
                            );
                          },
                          child: const Text('حسناً'),
                        ),
                      ],
                    ),
                  );
                }
                putmoney1(money1 - products[index1]);
                if (index1 != 18) Navigator.of(context).pop();
              }
            },
            child: const Text('سأشتري'),
          ),
        ],
      ),
    );
    putCurrentPlayer(!currentPlayer);

    moveSecondPlayer(context);
  }

  void take(BuildContext context) {
    if (!currentPlayer) {
      //it's me

      putmoney1(money1 + products[index2]);
      if (money2 < products[index2]) {
        putindex2(index2 - 1);
      } else {
        putmoney2(money2 - products[index2]);
      }
      putCurrentPlayer(!currentPlayer);
      moveSecondPlayer(context);
    } else {
      putmoney2(money2 + products[index1]);
      if (money1 < products[index1]) {
        putindex1(index1 - 1);
      } else {
        putmoney1(money1 - products[index1]);
      }
      putCurrentPlayer(!currentPlayer);
    }
  }

  void pay(BuildContext context) {
    if (!currentPlayer) {
      putmoney2(money2 + products[index1]);
      if (money1 < products[index1]) {
        putindex1(index1 - 1);
      } else {
        putmoney1(money1 - products[index1]);
      }
      putCurrentPlayer(!currentPlayer);
      moveSecondPlayer(context);
    } else {
      putmoney1(money1 + products[index2]);
      if (money2 < products[index2]) {
        putindex2(index2 - 1);
      } else {
        putmoney2(money2 - products[index2]);
      }
      putCurrentPlayer(!currentPlayer);
    }
  }

  AudioPlayer player = AudioPlayer();
  int counter = 0;
  void rollingDice() {
    player.setAsset('assets/audios/dice.mp3');
    player.play();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      counter++;

      putimgIndex(Random().nextInt(6));

      if (counter > 10) {
        timer.cancel();

        counter = 0;
        putY(imgIndex + 1);
      }
    });
  }

  void goBack(BuildContext context) {
    int co = 8;

    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (!currentPlayer) {
        puti(i + 1);
      } else {
        putu(u + 1);
      }
      co--;
      if (co == 0) {
        timer.cancel();
        pay(context);
      }
    });
  }

  void goOn(int co, BuildContext context, val) {
    int co2 = co;
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (!currentPlayer) {
        if (i == 0 && j < 7) {
          putj(j + 1);
        } else if (j == 7 && i < 9) {
          puti(i + 1);
        } else if (i == 9 && j > 0) {
          putj(j - 1);
        } else if (j == 0 && i > 0) {
          puti(i - 1);
        }
      } else {
        if (u == 0 && v < 7) {
          putv(v + 1);
        } else if (v == 7 && u < 9) {
          putu(u + 1);
        } else if (u == 9 && v > 0) {
          putv(v - 1);
        } else if (v == 0 && u > 0) {
          putu(u - 1);
        }
      }
      co--;
      if (co == 0) {
        timer.cancel();
        if (co2 == 3) {
          take(context);
        } else {
          rent(context, 2, val);
        }
      }
    });
  }

  void move(int co, BuildContext context, double height, double width) {
    Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (i == 0 && j < 7) {
          putj(j + 1);
        } else if (j == 7 && i < 9) {
          puti(i + 1);
        } else if (i == 9 && j > 0) {
          putj(j - 1);
        } else if (j == 0 && i > 0) {
          puti(i - 1);
        }
        putY(y - 1);
        co--;
        if (co == 0) {
          timer.cancel();

          String z = list[i][j];
          //       z = 'start';
          if (z == 'start') {
            start(context);
          } else if (z == 'buy') {
            buy(context);
          } else if (z == 'tentant') {
            if (tentant == 1) {
              take(context);
            } else if (tentant == 0) {
              pay(context);
            } else {
              putCurrentPlayer(!currentPlayer);
              moveSecondPlayer(context);
            }
          } else if (z == 'double') {
            putmoney1(money1 + 2 * products[index1]);
            putCurrentPlayer(!currentPlayer);

            moveSecondPlayer(context);
          } else if (z == 'goOn3') {
            goOn(3, context, 50);
          } else if (z == 'goOn4') {
            goOn(4, context, 50);
          } else if (z == 'take') {
            take(context);
          } else if (z == 'chance') {
            chance(context, height, width);
          } else if (z == 'goBack8') {
            goBack(context);
          } else if (z == 'rent') {
            rent(context, 2, 50);
          } else if (z == 'pay') {
            pay(context);
          }
        }
      },
    );
  }

  Future<void> moveSecondPlayer(BuildContext context) async {
    player.setAsset('assets/audios/dice.mp3');
    player.play();
    int co = 0;
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      counter++;

      putimgIndex(Random().nextInt(6));

      if (counter == 10) {
        timer.cancel();

        counter = 0;
        putY3(imgIndex + 1);
        co = imgIndex + 1;
      }
    });

    Timer.periodic(
      const Duration(milliseconds: 250),
      (timer) {
        if (co > 0) {
          if (u == 0 && v < 7) {
            putv(v + 1);
          } else if (v == 7 && u < 9) {
            putu(u + 1);
          } else if (u == 9 && v > 0) {
            putv(v - 1);
          } else if (v == 0 && u > 0) {
            putu(u - 1);
          }
        }

        co--;
        if (co == 0) {
          timer.cancel();

          String z = list[u][v];

          if (z == 'start') {
            start(context);
          } else if (z == 'buy') {
            if (money2 >= products[index2 + 1]) {
              putindex2(index2 + 1);
              putmoney2(money2 - products[index2]);

              if (index2 == 18) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 0,
                    backgroundColor: Colors.purple[50],
                    title: const Text(
                      '.لقد خسرت',
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ));
                        },
                        child: const Text('حسناً'),
                      ),
                    ],
                  ),
                );
              }
            } else {
              putmoney2(money2 + products[index2]);
            }
            putCurrentPlayer(!currentPlayer);
          } else if (z == 'tentant') {
            if (tentant == 0) {
              take(context);
            } else if (tentant == 1) {
              pay(context);
            } else {
              putCurrentPlayer(!currentPlayer);
            }
          } else if (z == 'double') {
            putmoney2(money2 + 2 * products[index2]);
            putCurrentPlayer(!currentPlayer);
          } else if (z == 'goOn3') {
            goOn(3, context, 50);
          } else if (z == 'goOn4') {
            goOn(4, context, 50);
          } else if (z == 'take') {
            take(context);
          } else if (z == 'chance') {
            putmoney2(money2 + 50);
            putCurrentPlayer(!currentPlayer);
          } else if (z == 'goBack8') {
            goBack(context);
          } else if (z == 'rent') {
            rent(context, 2, 50);
          } else if (z == 'pay') {
            pay(context);
          }
        }
      },
    );
  }

  Future<void> rollingChance() async {
    await player.setAsset('assets/audios/dice.mp3');
    player.play();
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      counter++;
      putimgIndex(Random().nextInt(6));
      if (counter > 3) {
        timer.cancel();
        counter = 0;
        putY2(imgIndex + 1);
        if (y2 > 3) {
          putmoney1(money1 - chanceMoney);
        } else {
          putmoney1(money1 + chanceMoney);
        }
        putchanceMoney(50);
      }
    });
  }

  void chance(BuildContext context, double height, double width) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
              elevation: 0,
              backgroundColor: Colors.purple[50],
              title: const Text(
                'حظظ أو خذ 50',
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                TextButton(
                  onPressed: () {
                    putmoney1(money1 + 50);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'سآخذ 50',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ),
                //سأحظظ
                TextButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 0,
                        backgroundColor: Colors.purple[50],
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        title: const Text(
                          'اختر المبلغ',
                          textAlign: TextAlign.center,
                        ),
                        content: Consumer<Player>(
                          builder: (context, value, child) => Text(
                            value.chanceMoney.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              if (chanceMoney == 50) {
                                return;
                              }
                              putchanceMoney(chanceMoney - 50);
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.pink,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();

                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (c) => Center(
                                  child: Consumer<Player>(
                                    builder: (context, value, child) =>
                                        ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 245, 78, 133),
                                      ),
                                      onPressed: () async {
                                        await rollingChance();
                                        int co = 0;
                                        Timer.periodic(
                                            const Duration(milliseconds: 100),
                                            (timer) {
                                          co++;
                                          if (co == 1) {
                                            timer.cancel();
                                            Navigator.of(c).pop();
                                            // ignore: use_build_context_synchronously
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.purple[50],
                                                title: Text(
                                                  imgIndex + 1 > 3
                                                      ? 'حظاً أوفر'
                                                      : 'لقد ربحت',
                                                  textAlign: TextAlign.center,
                                                ),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text(
                                                      'حسناً',
                                                      style: TextStyle(
                                                        color: Colors.pink,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      child: const Text('حظظ'),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'حسناً',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.pink,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (chanceMoney + 100 >= money1) {
                                putchanceMoney(money1);
                                return;
                              }
                              putchanceMoney(chanceMoney + 100);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    'سأحظظ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ));
    putCurrentPlayer(!currentPlayer);
    // ignore: use_build_context_synchronously
    moveSecondPlayer(
      context,
    );
  }

  void rent(BuildContext context, int ten, int val) async {
    if (money1 == 0 && money2 == 0) {
      puttentant(2);
      return;
    }
    if (ten == 0 || money1 == 0) {
      putmoney2(money2 - chanceMoney);
      putchanceMoney(50);
      puttentant(0);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          elevation: 0,
          backgroundColor: Colors.purple[50],
          title: const Text(
            '.اللاعب الآخر استأجر المزرعة',
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسناً',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      );

      putCurrentPlayer(!currentPlayer);
      if (currentPlayer) {
        moveSecondPlayer(context);
      }
      return;
    }
    if (ten == 1) {
      putmoney1(money1 - chanceMoney);
      puttentant(1);
      putchanceMoney(50);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          elevation: 0,
          title: const Text(
            '.مبروك لقد استأجرت المزرعة',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسناً',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      );

      putCurrentPlayer(!currentPlayer);
      if (currentPlayer) {
        moveSecondPlayer(context);
      }
      return;
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.purple[50],
        title: const Text(
          'اختر المبلغ',
          textAlign: TextAlign.center,
        ),
        content: Consumer<Player>(
          builder: (context, value, child) => Text(
            '${value.chanceMoney}',
            style: const TextStyle(
              color: Colors.purple,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          GestureDetector(
            onTap: () {
              if (chanceMoney == val) {
                return;
              }
              putchanceMoney(chanceMoney - 50);
            },
            onLongPress: () {
              putchanceMoney(val);
            },
            child: const Icon(
              Icons.remove,
              color: Colors.purple,
            ),
          ),
          TextButton(
            onPressed: () {
              if (chanceMoney == val && val != 50) {
                return;
              }
              Navigator.of(context).pop();
              if (money2 * 0.7 > chanceMoney) {
                putchanceMoney(chanceMoney + 50);
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 0,
                    backgroundColor: Colors.purple[50],
                    title: Consumer<Player>(
                      builder: (context, value, child) => Text(
                        'اللاعب الآخر دفع: ${value.chanceMoney}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    content: const Text(
                      'هل تود أن تزيد عليه؟',
                      textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          rent(context, 0, val);
                        },
                        child: const Text(
                          'لا',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (money1 <= chanceMoney) {
                            return;
                          }
                          putchanceMoney(chanceMoney);
                          _chanceMoney = chanceMoney;
                          Navigator.of(context).pop();
                          rent(context, 2, chanceMoney);
                        },
                        child: const Text(
                          'نعم',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                rent(context, 1, val);
              }
            },
            child: const Text(
              'حسناً',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (chanceMoney + 100 >= money1) {
                putchanceMoney(money1);
                return;
              }
              putchanceMoney(chanceMoney + 100);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
  // //current player
  // int _currentPlayer = 0;
  // int get currentPlayer {
  //   return _currentPlayer;
  // }

  // void putcurrentPlayer(int currentPlayer) {
  //   _currentPlayer = currentPlayer;
  //   notifyListeners();
  // }
  List<int> products = [
    0,
    50,
    50,
    100,
    100,
    150,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    1000,
    1500,
    2000,
    2500,
    30000,
  ];
  List<String> images = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];
  List<List<String>> list = [
    //0
    [
      'start',
      'buy',
      'tentant',
      'double',
      'goOn3',
      'double',
      'buy',
      'take',
    ],
    //1
    [
      'goBack8',
      '',
      '',
      '',
      '',
      '',
      '',
      'buy',
    ],
    //2
    [
      'double',
      '',
      '',
      '',
      '',
      '',
      '',
      'double',
    ],
    //3
    [
      'tentant',
      '',
      '',
      '',
      '',
      '',
      '',
      'buy',
    ],
    //4
    [
      'buy',
      '',
      '',
      '',
      '',
      '',
      '',
      'chance',
    ],
    //5
    [
      'chance',
      '',
      '',
      '',
      '',
      '',
      '',
      'goOn4',
    ],
    //6
    [
      'buy',
      '',
      '',
      '',
      '',
      '',
      '',
      'double',
    ],
    //7
    [
      'double',
      '',
      '',
      '',
      '',
      '',
      '',
      'buy',
    ],
    //8
    [
      'buy',
      '',
      '',
      '',
      '',
      '',
      '',
      'tentant',
    ],
    //9
    [
      'pay',
      'tentant',
      'double',
      'buy',
      'chance',
      'double',
      'buy',
      'rent',
    ],
  ];
}
