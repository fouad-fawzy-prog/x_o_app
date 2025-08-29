import 'package:flutter/material.dart';

class PlayerChoice extends StatelessWidget {
  const PlayerChoice({
    super.key,
    required this.text,
    required this.color,
    required this.onpress,
  });
  final String text;
  final Color color;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(170, 150),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 110,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
