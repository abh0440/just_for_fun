import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_for_fun/screens/roulette_screen.dart';

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
          Get.to(() => RouletteScreen(players: players));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              autocorrect: false,
              controller: _playerNameController,
              decoration: InputDecoration(
                hintText: "Enter Player Name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_playerNameController.text.isNotEmpty) {
                      setState(() {
                        players.add(_playerNameController.text.trim());
                        _playerNameController.clear();
                      });
                    }
                  },
                ),
              ),
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
