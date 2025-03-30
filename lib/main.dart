import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_flutter/models/sudoku_board.dart';
import 'package:sudoku_flutter/screens/sudoku_screen.dart';

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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sudoku Solver")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SudokuScreen()));
                // Navigate to Sudoku Game Screen
              },
              child: Text("Play Sudoku"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Scan Sudoku Screen
              },
              child: Text("Scan Sudoku"),
            ),
          ],
        ),
      ),
    );
  }
}
