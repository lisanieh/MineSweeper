import 'package:minesweeper/minesweeper.dart' as minesweeper;
import 'dart:io';

void main(List<String> arguments) {
  print("please enter row size, col size, and mine number, separated with spaces");
  String? input = stdin.readLineSync();
  List splitInput = input!.split(" ");
  int row = int.parse(splitInput[0]);
  int col = int.parse(splitInput[1]);
  int mineNum = int.parse(splitInput[2]);
  var board = minesweeper.boarderGenerate(row, col, mineNum);
  print("the initial border is :");
  for (int i = 0; i < row; i++) {
    List tmp = [];
    for (int j = 0; j < col; j++) {
      tmp.add(board[i * col + j]);
    }
    print(tmp);
  }

  print("please enter first position with x,y, separated with comma");
  String? vertix = stdin.readLineSync();
  List splitVertix = vertix!.split(",");
  int x = int.parse(splitVertix[0]);
  int y = int.parse(splitVertix[1]);
  var result = minesweeper.minePosition(board, row, col, x, y);
  var minePos = result['minePos'];
  var newBoard = result['board'];
  print("mine position: $minePos");
  print("the new border is :");
  for (int i = 0; i < row; i++) {
    List tmp = [];
    for (int j = 0; j < col; j++) {
      tmp.add(newBoard[i * col + j]);
    }
    print(tmp);
  }
}
