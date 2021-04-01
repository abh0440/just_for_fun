import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class RouletteScreen extends StatefulWidget {
  final List<String> players;
  RouletteScreen({Key key, @required this.players}) : super(key: key);

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roulette"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.replay_outlined),
            onPressed: () {
              setState(() {
                selected = Random().nextInt(widget.players.length);
              });
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected,
                items: [
                  for (var it in widget.players) FortuneItem(child: Text(it)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
