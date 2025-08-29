import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  const BoardTile({
    super.key,
    required this.symbol,
    required this.onTap,
    required this.index,
  });
  final String symbol;
  final int index;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        child: symbol.isEmpty
            ? Container()
            : Image.asset('assets/images/$symbol.jfif'),
      ),
    );
  }
}
