int gridSize =50;
boolean flag;
Cell[][] arr = new Cell[gridSize][gridSize];
//Cell[][] cells = new Cell[n][n];
//cells[0][0] = new Cell();
int mode;
int totalMines;
int points;
void setup() {
  size(800, 800);
  //SET GRID
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j< gridSize; j++) {
      int rand = (int) random(7);

      //arr[i][j] = (rand == 0)? 9 : 10;
      arr[i][j] = new Cell(width/(gridSize) *i, height/(gridSize) *j, width/gridSize, (rand == 0) ? true : false, 0);
    }
  }
  //ASSIGN NUMBER OF MINES
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j< gridSize; j++) {
      if (arr[i][j].bomb == false) {
        arr[i][j].mines = checkMines(i, j);
      } else{
        totalMines++;
      }
    }
  }
  
}

void draw() {
  if (mode == 0) {
    textAlign(LEFT, TOP);
    textSize( width/gridSize);
    points = 0;
    //DRAW GRID
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j< gridSize; j++) {
        //CHECK WIN
        if(arr[i][j].bomb == true && arr[i][j].flagged == true){
          points++;
        } else if(arr[i][j].bomb == false && arr[i][j].flagged == true){
          points --;
        }
        if (arr[i][j].reveal == false) {
          fill(200);
          rect(width/(gridSize) *i, height/(gridSize) *j, width/gridSize, height/gridSize);
        } else if (arr[i][j].bomb == true && arr[i][j].reveal == true) {
          fill(255, 0, 0);
          rect(width/(gridSize) *i, height/(gridSize) *j, width/gridSize, height/gridSize);
        } else {
          fill(150);
          rect(width/(gridSize) *i, height/(gridSize) *j, width/gridSize, height/gridSize);
          fill(0);
          if (arr[i][j].mines !=0) {
            text(arr[i][j].mines, width/(gridSize) *i, height/(gridSize) *j);
          }
        }

        if (arr[i][j].flagged) {
          fill(0);
          text("F", width/(gridSize) *i, height/(gridSize) *j);
        }
      }
    }
    if(points == totalMines){
       mode =2; 
    }
    println(totalMines, points);
  } else if(mode ==1){

    
    for(int i = 0; i < gridSize; i++){
      for(int j = 0; j < gridSize; j++){
        if(arr[i][j].bomb == true){
          fill(255, 0, 0);
          rect(width/(gridSize) *i, height/(gridSize) *j, width/gridSize, height/gridSize);
        }
      }
    }
    
        //GAME OVER
    fill(255, 255, 0);
    textSize(100);
    text("Game Over", 100, 350);
  } else if(mode == 2){
    fill(0, 255, 0);
    textSize(100);
    text("You Win", 100, 350);
  }
}
void keyPressed() {
  if (key == 'f') {
    flag = true;
  }
}
void keyReleased() {
  if (key == 'f') flag = false;
}
void mouseReleased() {

  if (flag == false) {
    if (arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].bomb == true) {
      //bomb
      mode = 1;
    } else {
      //not bomb
      arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].flagged = false;
      arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].reveal = true;
      setCell(mouseX/(800/gridSize), mouseY/(800/gridSize));
    }
  } else {
    if (!arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].flagged && !arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].reveal) {
      arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].flagged = true;
    } else {
      arr[mouseX/(800/gridSize)][mouseY/(800/gridSize)].flagged = false;
    }
  }
}
int checkMines(int row, int col) {
  int numberOfMines = 0;

  if (col > 0 && arr[row][col-1].bomb == true) numberOfMines++;
  if ((row < gridSize-1) && (col < gridSize-1) && (arr[row+1][col+1].bomb == true)) numberOfMines++;
  if (col < gridSize -1 && arr[row][col + 1].bomb == true) numberOfMines++;
  if (row > 0 && col < gridSize-1 && arr[row-1][col + 1].bomb == true) numberOfMines++;
  if (row < gridSize-1 && arr[row+1][col].bomb == true) numberOfMines++;
  if (row > 0 && arr[row-1][col].bomb == true) numberOfMines++;
  if (row < gridSize-1 && col > 0 && arr[row +1][col - 1].bomb == true) numberOfMines++;
  if (row > 0 && col> 0 && arr[row-1][col - 1].bomb == true) numberOfMines++;


  return numberOfMines;
}

int cnt=0;
void setCell(int row, int col) {
  if (arr[row][col].mines == 0) {
    for (int i = row-1; i <= row +1; i++) {
      for (int j = col-1; j <= col+1; j++) {
        if (i >= 0 && i <= gridSize-1 && j >= 0 && j <= gridSize-1) {
          if (!arr[i][j].bomb && !arr[i][j].reveal&& !arr[i][j].flagged) {
            
            arr[i][j].reveal = true;  
            setCell(i, j);
          }
        }
      }
    }
  }
}
