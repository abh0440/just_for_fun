import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //for text controller
  TextEditingController _playerNameController = TextEditingController();

  //to store player name
  List<String> players = [];

  //for random
  final _random = new Random();

  //for popup
  List<String> popupItem = ["Free Lunch", "Lunch Split"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Press Me"),
        onPressed: () {
          Future.delayed(Duration(milliseconds: 5000), () {
            Get.back();
            var winner = players[_random.nextInt(players.length)];
            Get.dialog(
              Dialog(
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16.0),
                  height: 150.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Congratulations",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        winner.toUpperCase(),
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "You win a free lunch!",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
          Get.dialog(
            Dialog(
              insetPadding: EdgeInsets.zero,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/casino-roulette.gif"),
              ),
            ),
            barrierDismissible: false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserNames(),
            _buildPlayerNameDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserNames() {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              autocorrect: false,
              controller: _playerNameController,
              decoration: InputDecoration(hintText: "Enter Player Name"),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                players.add(_playerNameController.text.trim());
                _playerNameController.clear();
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 32.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerNameDisplay() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(players[index]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    players.removeAt(index);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
