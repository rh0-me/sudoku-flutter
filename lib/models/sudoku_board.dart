import 'package:flutter/material.dart';
import 'dart:io';

class SudokuBoard extends ChangeNotifier {
  List<List<int>> board = List.generate(9, (_) => List.filled(9, 0));

  int? selectedRow;
  int? selectedCol;

  void updateCell(int value) {
    if (value > 9 || value < 0) {
      throw Exception("Invalid cell content");
    }
    if (selectedCol != null || selectedRow != null) {
      if (isValidMove(selectedRow!, selectedCol!, value)) {
        board[selectedRow!][selectedCol!] = value;
        notifyListeners();
        printBoard();
      }
    }
  }

  void selectCell(int row, int col) {
    selectedRow = row;
    selectedCol = col;
    notifyListeners();
  }

  int getCell(int row, int col) {
    return board[row][col];
  }

  bool isValidMove(int row, int col, int num) {
    return !_isDuplicateInRow(row, num) &&
        !_isDuplicateInCol(row, col, num) &&
        !_isDuplicateInBlock(row, col, num);
  }

  bool _isDuplicateInRow(int row, int num) {
    for (int i = 0; i < 9; i++) {
      if (selectedCol != i && board[row][i] == num) {
        return true;
      }
    }
    return false;
  }

  bool _isDuplicateInCol(int row, int col, int num) {
    for (int i = 0; i < 9; i++) {
      if (i != selectedRow && board[i][col] == num) {
        return true;
      }
    }
    return false;
  }

  bool _isDuplicateInBlock(int row, int col, int num) {
    int boxRow = (row ~/ 3) * 3;
    int boxCol = (col ~/ 3) * 3;

    for (int r = 0; r < 3; r++) {
      for (int c = 0; c < 3; c++) {
        if (selectedRow != boxRow + r &&
            selectedCol != boxCol + c &&
            board[boxRow + r][boxCol + c] == num) {
          return true;
        }
      }
    }

    return false;
  }

  void clearBoard() {
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        board[r][c] = 0;
      }
    }
    notifyListeners();
  }

  void printBoard() async {
    stdout.writeln("///////////////////////");
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        stdout.write("${board[r][c] == 0 ? " " : board[r][c]} ");
        if (c % 3 == 2) stdout.write("|");
      }
      if (r % 3 == 2) {
        stdout.writeln("\n---------------------");
      } else {
        stdout.writeln();
      }
    }
    stdout.writeln("///////////////////////");
  }

  void initBoard() {
    board = [
      [6, 0, 0, 0, 7, 9, 0, 3, 2],
      [0, 0, 0, 0, 6, 0, 5, 0, 0],
      [2, 0, 9, 0, 0, 8, 7, 0, 0],
      [9, 0, 6, 3, 0, 5, 0, 0, 1],
      [8, 5, 0, 0, 0, 0, 3, 0, 0],
      [4, 7, 3, 0, 0, 1, 2, 5, 0],
      [0, 4, 2, 6, 8, 0, 9, 0, 0],
      [0, 0, 0, 0, 1, 3, 4, 2, 7],
      [0, 9, 0, 2, 0, 0, 6, 0, 0],
    ];
    notifyListeners();
  }
}
