# Minesweeper function

## initial setups
### just for testing
1. you can just git clone the whole folder to your local
2. open the command in `minesweeper/bin`
3. type `dart minesweeper.dart` in your command line
4. ensure you have installed dart package in advance
### usage in flutter app
1. you can download flutter through the official website and follow the guide:
https://docs.flutter.dev/get-started/install
2. choose your IDE and download dart: https://docs.flutter.dev/get-started/test-drive?tab=vscode
3. open your flutter project

## download package
### add package
add package to `pubspec.yaml` in your flutter project
```
dependencies:
  minesweeper:
    git:
      url: https://github.com/lisanieh/MineSweeper.git
      ref: master
```
### usage
this is a sample for you in your `main.dart`
```
import 'package:minesweeper/minesweeper.dart';

void main(){
  int row = //the desired row number
  int col = //the desired colume number
  int mineNum = //the desired mine number
  var board = minesweeper.boarderGenerate(row, col, mineNum);
  print("the initial border is :");
  for (int i = 0; i < row; i++) {
    List tmp = [];
    for (int j = 0; j < col; j++) {
      tmp.add(board[i * col + j]);
    }
    print(tmp);
  }

  int x = //the desired x position
  int y = //the desired y position
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
```
