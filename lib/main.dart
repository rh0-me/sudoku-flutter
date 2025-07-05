import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_flutter/models/sudoku_board.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SudokuBoard(),
      child: SudokuApp(),
    ),
  );
}

class SudokuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Solver',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

