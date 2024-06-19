import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DigitalWatch extends StatefulWidget {
  const DigitalWatch({Key? key}) : super(key: key);

  @override
  State<DigitalWatch> createState() => _DigitalWatchState();
}

class _DigitalWatchState extends State<DigitalWatch> {
  int timerHour = 0;
  int timerMinute = 0;
  int timerSecond = 0;

  int hour = 0;
  int minute = 0;
  int second= 0;

  bool isDigital = true;
  bool isAnalog = false;
  bool isstop = false;
  bool istimer = false;

  Future<void> timerWatch() async {
    istimer = true;
    await Future.delayed(const Duration(milliseconds: 50), () {
      if (istimer) {
        timerSecond++;
      }
      if (timerSecond > 59) {
        timerSecond = 0;
        timerMinute++;
      }
      if (timerMinute > 59) {
        timerMinute = 0;
        timerHour++;
      }
      if (timerHour > 12) {
        timerHour = 0;
      }
      setState(() {});
    });
    if (istimer) {
      timerWatch();
    }
  }

  myClock() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            myClock();
          },
        );
      },
    );
  }

  @override
  void initState() {
    myClock();
    super.initState();
  }

  List timerWatchHist = [];
  int lapNumber = 1;



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
      });
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: const Text(
          "clock app",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Prince Buha'),
              accountEmail: const Text('Princebuha105@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/150029430?s=400&u=78aa9773a458517884ce2beb2d60bfd36592796d&v=4',
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow.shade800,
              ),
            ),
            ListTile(
              title: const Text('Digital clock'),
              trailing: Switch(
                activeColor: Colors.purple,
                onChanged: (val) {
                  isDigital = val;
                  setState(() {});
                },
                value: isDigital,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Analog clock'),
              onTap: () {},
              trailing: Switch(
                activeColor: Colors.purple,
                value: isAnalog,
                onChanged: (val) {
                  isAnalog = val;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: const Text('Strp Watch'),
              onTap: () {},
              trailing: Switch(
                activeColor: Colors.purple,
                value: isstop,
                onChanged: (val) {
                  isstop = val;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: const Text('timer Watch'),
              onTap: () {},
              trailing: Switch(
                activeColor: Colors.purple,
                value: istimer,
                onChanged: (val) {
                  istimer = val;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: isDigital,
              child: Container(
                height: 150,
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow.shade800,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    hour.toString().padLeft(2, '0'),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 15,
                          ),
                          const Text(
                            ":",
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 15,
                          ),
                          Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  minute.toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 15,
                          ),
                          const Text(
                            ":",
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                            width: 15,
                          ),
                          Center(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  second.toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${DateTime.now().day.toString().padLeft(2, '0')}/"
                          "${DateTime.now().month.toString().padLeft(2, '0')}/"
                          "${DateTime.now().year.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 360 / 60 = 6
            //
            Visibility(
              visible: isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: index * (pi * 2) / 60,
                      child: Divider(
                        color:
                            (index % 5 == 0) ? Colors.blueGrey : Colors.white54,
                        thickness: (index % 5 == 0) ? 4 : 2,
                        endIndent: (index % 5 == 0) ? w * 0.9 : w * 0.97,
                      ),
                    ),
                  ),

                  // second
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: second * (pi * 2) / 60,
                      child: Divider(
                        thickness: 2.5,
                        color: Colors.red,
                        endIndent: w * 0.4,
                      ),
                    ),
                  ),

                  // minute
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: minute * (pi * 2) / 60,
                      child: Divider(
                        thickness: 4,
                        color: Colors.white,
                        indent: w * 0.2,
                        endIndent: w * 0.43,
                      ),
                    ),
                  ),

                  // hour
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: (hour % 12 + (minute / 60)) * (pi * 2) / 12,
                      child: Divider(
                        thickness: 6,
                        color: Colors.white,
                        indent: w * 0.3,
                        endIndent: w * 0.45,
                      ),
                    ),
                  ),

                  // dot
                  CircleAvatar(
                    radius: w * 0.02,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),

            Visibility(
              visible: isstop,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                    scale: 8,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      value: second / 60,
                      color: Colors.red.shade400,
                    ),
                  ),
                  Transform.scale(
                    scale: 7,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      value: minute / 60,
                      color: Colors.yellow.shade900,
                    ),
                  ),
                  Transform.scale(
                    scale: 6,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      value: (hour % 12 + (minute / 60)) / 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${hour.toString().padLeft(2, '0')} : ${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')} ",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            Visibility(
              visible: istimer,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: w,
                      height: h * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.orange.shade500,
                        ),

                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade300,
                                  borderRadius: BorderRadius.circular(20)
                                ),

                                alignment: Alignment.center,
                                child: Text(
                                  timerHour.toString().padLeft(2, '0'),
                                  style: TextStyle(fontSize: textScaler.scale(35),
                                  color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                ":",
                                style: TextStyle(
                                  fontSize: textScaler.scale(40),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade300,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text(
                                  timerMinute.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: textScaler.scale(35),
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                ":",
                                style: TextStyle(
                                  fontSize: textScaler.scale(40),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade300,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text(
                                  timerSecond.toString().padLeft(2, '0'),
                                  style: TextStyle(fontSize: textScaler.scale(35),color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (!istimer) {
                            timerWatch();
                          }
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.orange.shade300,
                            )),
                        child: const Icon(Icons.play_arrow,color: Colors.white,),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          istimer = false;
                          timerWatchHist.add({
                            'hour': timerHour,
                            'minute': timerMinute,
                            'second': timerSecond,
                          });
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                               Colors.orange.shade300
                            )),
                        child: const Icon(Icons.pause,color: Colors.white,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      hour = minute = second = 0;
                      istimer = false;
                      timerWatchHist = [];
                      setState(() {});
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orange.shade300,
                        )),
                    child: const Icon(Icons.restart_alt,color: Colors.white,),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
