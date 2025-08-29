import 'package:flutter/material.dart';
import 'package:x_o_app/pages/game_page.dart';
import 'package:x_o_app/widgets/models/data_args_model.dart';

import 'package:x_o_app/widgets/player_choice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routingName = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff00D2FF), Color(0xff3A7BD5)],
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 1),
            Text(
              'Tix-Tac-Toe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 1),
            Text(
              'Pick who goes first?',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlayerChoice(
                    text: 'X',
                    color: Colors.redAccent,
                    onpress: () {
                      Navigator.pushNamed(
                        context,
                        GamePage.routingName,
                        arguments: DataArgsModel(
                          firstPlayer: 'X',
                          secondPlayer: 'o',
                        ),
                      );
                    },
                  ),
                  PlayerChoice(
                    text: 'O',
                    color: Colors.greenAccent,
                    onpress: () {
                      Navigator.pushNamed(
                        context,
                        GamePage.routingName,
                        arguments: DataArgsModel(
                          firstPlayer: 'o',
                          secondPlayer: 'X',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
