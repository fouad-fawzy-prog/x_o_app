import 'package:flutter/material.dart';
import 'package:x_o_app/widgets/board_tile.dart';
import 'package:x_o_app/widgets/models/data_args_model.dart';

class GamePage extends StatefulWidget {
  GamePage({super.key});
  static const routingName = 'GamePage';
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;
  late DataArgsModel args;
  String title = "Player 1's Turn";
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as DataArgsModel;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Player 1 (${args.firstPlayer})',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      '$player1Score',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Player 2 (${args.secondPlayer})',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      '$player2Score',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoardTile(
                            symbol: boardState[0],
                            index: 0,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[1],
                            index: 1,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[2],
                            index: 2,
                            onTap: onTap,
                          ),
                        ],
                      ),
                    ),
                    Container(height: 1, color: Colors.black),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoardTile(
                            symbol: boardState[3],
                            index: 3,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[4],
                            index: 4,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[5],
                            index: 5,
                            onTap: onTap,
                          ),
                        ],
                      ),
                    ),
                    Container(height: 1, color: Colors.black),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoardTile(
                            symbol: boardState[6],
                            index: 6,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[7],
                            index: 7,
                            onTap: onTap,
                          ),
                          Container(width: 1, color: Colors.black),
                          BoardTile(
                            symbol: boardState[8],
                            index: 8,
                            onTap: onTap,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // x=>player1 , o=>player2
  int counter = 0;

  void onTap(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (args.firstPlayer == 'X') {
      if (counter % 2 == 0) {
        boardState[index] = 'X';
        title = "Player 1's Turn";
      } else {
        boardState[index] = 'o';
        title = "Player 2's Turn";
      }
    } else if (args.firstPlayer == 'o') {
      if (counter % 2 == 0) {
        boardState[index] = 'o';
        title = "Player 1's Turn";
      } else {
        boardState[index] = 'X';
        title = "Player 2's Turn";
      }
    }

    counter++;
    setState(() {});

    if (ckeckWinner(args.firstPlayer)) {
      player1Score++;
      // title = "Player 1's Win";
      Future.delayed(Duration(seconds: 1), resetBoard);

      setState(() {});
    } else if (ckeckWinner(args.secondPlayer)) {
      player2Score++;
      title = "Player 2's Win";
      Future.delayed(Duration(seconds: 1), resetBoard);
      setState(() {});
    } else if (counter == 9) {
      Future.delayed(Duration(seconds: 1), resetBoard);
      title = "Non of Players Win";
      setState(() {});
    }
  }

  bool ckeckWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    } else if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    } else {
      return false;
    }
  }

  void resetBoard() {
    for (int i = 0; i < 9; i++) {
      boardState[i] = '';
    }
    counter = 0;
    setState(() {});
  }
}
