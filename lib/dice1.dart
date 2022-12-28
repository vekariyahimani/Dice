import 'dart:math';

import 'package:flutter/material.dart';

class Dice1 extends StatefulWidget {
  const Dice1({Key? key}) : super(key: key);

  @override
  State<Dice1> createState() => _HomeState();
}

class _HomeState extends State<Dice1> {
  List l1 = [
    "assets/image/dice1.png",
    "assets/image/dice2.png",
    "assets/image/dice3.png",
    "assets/image/dice4.png",
    "assets/image/dice5.png",
    "assets/image/dice6.png",
  ];
  List diceList = [];
  List rndList = [];
  int i = 0, n = 0, y = 0,z = 0,b = 0;
  TextEditingController txtdata = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Dice App",
                style: TextStyle(fontSize: 25,)),
            centerTitle: true,
            backgroundColor: Colors.red.shade900),
        backgroundColor: Colors.red.shade200,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtdata,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2)),
                    label: Text(
                      "Add Number:",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red.shade900))),
                style: TextStyle(color: Colors.red.shade900),
              ),
              InkWell(
                onTap: () {
                  String a = txtdata.text;
                  n = int.parse(a);
                  diceList.clear();
                  rndList.clear();
                  setState(() {
                    diceList.length=n;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.redAccent.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.red.shade900, width: 2)),
                    child: Text("Gen",
                        style: TextStyle(
                            color: Colors.black, fontSize: 25)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: diceList.asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(l1[rndList.isEmpty?0:rndList[e.key]],height: 100,width: 100,),
                  )).toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  rndList.clear();
                  setState(() {
                    var rnd = Random();
                    b=rndList.length;
                    for(y=0;y<n;y++)
                    {
                      z = rnd.nextInt(6);
                      b=b+z;
                      rndList.add(z);
                      print(b);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.redAccent.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.redAccent.shade700, width: 2)),
                    child: Text("Play",
                        style: TextStyle(
                            color: Colors.black, fontSize: 25)),
                  ),
                ),
              ),
              Container(
                width: 550,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.redAccent.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Colors.redAccent.shade700, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sum all Dice",
                        style: TextStyle(
                            color: Colors.black, fontSize: 25)),
                    Text("$b",
                        style: TextStyle(
                            color: Colors.red.shade900, fontSize: 25)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}