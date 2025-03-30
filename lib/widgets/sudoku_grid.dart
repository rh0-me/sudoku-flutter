import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_flutter/models/sudoku_board.dart';
import 'package:sudoku_flutter/widgets/sudoku_selection_bar.dart';

class SudokuGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sudokuBoard = context.watch<SudokuBoard>();

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          width: 400,
          height: 400,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9, childAspectRatio: 1),
            itemCount: 81,
            itemBuilder: (context, index) {
              int row = index ~/ 9;
              int col = index % 9;
              return _buildCell(context, sudokuBoard, row, col);
            },
          ),
        ),
        SelectionBar(),
      ],
    );
  }

  Widget _buildCell(BuildContext context, SudokuBoard board, int row, int col) {
    bool isSelected = board.selectedRow == row && board.selectedCol == col;
    bool isInSameRow = board.selectedRow == row;
    bool isInSameColumn = board.selectedCol == col;

    int blockRow = board.selectedRow ?? 0 ~/ 3 * 3;
    int blockCol = board.selectedCol ?? 0 ~/ 3 * 3;

    bool isInSameBlock = (row >= blockRow && row < blockRow + 3) &&
        (col >= blockCol && col < blockCol);

    int value = board.getCell(row, col);
    int selectedValue = board.selectedRow != null && board.selectedCol != null
        ? board.getCell(board.selectedRow!, board.selectedCol!)
        : 0;

    bool isError = value != 0 && !board.isValidMove(row, col, value);
    Color cellColor = Colors.transparent;

    if (isSelected) {
      cellColor = Colors.blue.withValues(alpha: 0.7);
    } else if (isInSameBlock || isInSameColumn || isInSameRow) {
      cellColor = Colors.lightBlue.withValues(alpha: 0.2);
    } else if (value == selectedValue) {
      cellColor = Colors.blueGrey.withValues(alpha: 0.5);
    }

    if (isError) {
      cellColor = Colors.red.withValues(alpha: 0.4);
    }

    return GestureDetector(
      onTap: () => board.selectCell(row, col),
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: cellColor,
          border: Border(
            top: BorderSide(color: Colors.black, width: row % 3 == 0 ? 2 : 1),
            left: BorderSide(color: Colors.black, width: col % 3 == 0 ? 2 : 1),
            right: BorderSide(
                color: Colors.black, width: col + 1 % 3 == 0 ? 2 : 1),
            bottom: BorderSide(
                color: Colors.black, width: row + 1 % 3 == 0 ? 2 : 1),
          ),
        ),
        child: Center(
          child: Text(
            value == 0 ? "" : value.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight:
                  value == selectedValue ? FontWeight.bold : FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
