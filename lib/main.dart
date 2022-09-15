import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var my = Axis.vertical;
  Random random = Random();
  var length = 0;
  var i = 0;
  List l = ["0", "0", "0", "0", "0", "0"];
  TextEditingController lengthcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15172b),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "OTP Generator",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfffcdb87)),
            ),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: lengthcontroller,
                onChanged: (val) {
                  length = int.parse(val);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter OTP Length",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfffcf6ba),
                      width: 1,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfffcf6ba), width: 1),
                  ),
                ),
                style: const TextStyle(color: Color(0xfffcf6ba), fontSize: 35),
              ),
            ),
            InkWell(
              onTap: () {
                l.clear();
                setState(() {
                  if (length > 1 || length <= 22) {
                    for (i = 1; i <= length; i++) {
                      l.add(random.nextInt(10).toString());
                      if (length >= 23) {
                        my = Axis.horizontal;
                      }
                    }
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 330,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0xffffe8b8),
                      offset: Offset(0, 2),
                      spreadRadius: 0.2,
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  "Generate OTP",
                  style: TextStyle(color: Color(0xff15172b), fontSize: 35),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffffe8b8),
              ),
              child: SingleChildScrollView(
                scrollDirection: my,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: l
                      .map((e) => Text(
                            e,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ))
                      .toList(),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  l.clear();
                  lengthcontroller.clear();
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffe8b8),
                      Color(0xfff6db87),
                    ],
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color(0xffffe8b8),
                      offset: Offset(0, 2),
                      spreadRadius: 0.2,
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Color(0xff15172b), fontSize: 35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
