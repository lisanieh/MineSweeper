library minesweeper_function;

import 'dart:math';

List boarderGenerate(int row, int col, int mineNum) {
  //check if input are available
  if ((row * col - 9) <= mineNum) {
    throw "Cannot set mine number equal to or bigger than ${row * col - 9}";
  }

  //initialized
  List board = List.generate(row * col, (i) => 0);

  //get random mine position
  Random random = Random();
  List minePos = [];
  while (minePos.length < mineNum) {
    int randPos = random.nextInt(row * col);
    if (!minePos.contains(randPos)) {
      minePos.add(randPos);
    }
  }

  //change bord num to -1 for mines
  for (int i = 0; i < board.length; i++) {
    if (minePos.contains(i)) {
      board[i] = -1;
    }
  }

  return board;
}

Map minePosition(List board, int row, int col, int x, int y) {
  //initialize
  List minePos = [];

  //find the minePos
  for (int i = 0; i < board.length; i++) {
    if (board[i] == -1) minePos.add(i);
  }

  //check if first position is mine
  if (minePos.contains(x * col + y)) {
    //if true, move the mine to another position
    minePos.remove(x * col + y);
    board[x * col + y] = 0;
    Random random = Random();
    int randPos = random.nextInt(row * col);
    while (minePos.contains(randPos)) {
      // randPos = random.nextInt(row * col);
      randPos++;
    }
    minePos.add(randPos);
    board[randPos] = -1;
  }

  //add adjacent num to other cell
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      if (board[i * col + j] == -1) {
        //add topMid
        if (i != 0 && board[(i - 1) * col + j] != -1) {
          board[(i - 1) * col + j] += 1;
        }
        //add topLeft
        if (i != 0 && j != 0 && board[(i - 1) * col + j - 1] != -1) {
          board[(i - 1) * col + j - 1] += 1;
        }
        //add topRight
        if (i != 0 && j != col - 1 && board[(i - 1) * col + j + 1] != -1) {
          board[(i - 1) * col + j + 1] += 1;
        }
        //add bottomMid
        if (i != row - 1 && board[(i + 1) * col + j] != -1) {
          board[(i + 1) * col + j] += 1;
        }
        // add bottomLeft
        if (i != row - 1 && j != 0 && board[(i + 1) * col + j - 1] != -1) {
          board[(i + 1) * col + j - 1] += 1;
        }
        //add bottomRight
        if (i != row - 1 &&
            j != col - 1 &&
            board[(i + 1) * col + j + 1] != -1) {
          board[(i + 1) * col + j + 1] += 1;
        }
        //add leftMid
        if (j != 0 && board[i * col + j - 1] != -1) {
          board[i * col + j - 1] += 1;
        }
        //add rightMid
        if (j != col - 1 && board[i * col + j + 1] != -1) {
          board[i * col + j + 1] += 1;
        }
      }
    }
  }

  return {"minePos": minePos, "board": board};
}
