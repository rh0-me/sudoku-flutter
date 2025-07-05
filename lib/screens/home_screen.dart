import 'package:flutter/material.dart';
import 'package:sudoku_flutter/screens/sudoku_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sudoku Solver"),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_4x4, size: 100),
            Column(
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
          ],
        ),
      ),
    );
  }
}
