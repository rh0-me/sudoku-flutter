import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sudoku_board.dart';
import '../widgets/sudoku_grid.dart';

class SudokuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Sudoku"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SudokuGrid(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Clear",
        onPressed: () {
          context.read<SudokuBoard>().clearBoard();
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.refresh),
      ),
      persistentFooterButtons: [
        IconButton(
            tooltip: "Print",
            icon: Icon(Icons.print),
            onPressed: () {
              context.read<SudokuBoard>().printBoard();
            }),
        IconButton(
            tooltip: "Init",
            icon: Icon(Icons.create),
            onPressed: () {
              context.read<SudokuBoard>().initBoard();
            }),
      ],
    );
  }
}
