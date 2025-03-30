import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_flutter/models/sudoku_board.dart';

class SelectionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sudokuBoard = context.watch<SudokuBoard>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= 9; i++) _buildNumberButton(context, i),
          _buildClearButton(context),
        ],
      ),
    );
  }

  Widget _buildNumberButton(BuildContext context, int number) {
    return GestureDetector(
      onTap: () {
        var board = context.read<SudokuBoard>();
        bool isValid =
            board.isValidMove(board.selectedRow!, board.selectedCol!, number);
        if (!isValid) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Invalid move!"), duration: Duration(seconds: 1)),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SudokuBoard>().updateCell(0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Text(
          'X',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
