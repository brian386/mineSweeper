
int n = 60;
boolean flag;
int[][] arr = new int[n][n];
//Cell[][] cells = new Cell[n][n];
//cells[0][0] = new Cell();

void setup(){
  size(800, 800);

  for(int i = 0; i < n; i++){
    for(int j = 0; j< n; j++){
      int rand = (int) random(6);
      
      arr[i][j] = (rand == 0)? 9 : 10;
      rect(width/(n) *i, height/(n) *j, width/n, height/n);
    }
  }

}

void draw(){
  for(int i = 0; i < n; i++){
    for(int j = 0; j< n; j++){
     //10 = not revealed
     // 9 = mine;
      if(arr[j][i] == 10){
        fill(200);
        rect(width/(n) *i, height/(n) *j, width/n, height/n);
      } else if(arr[j][i] == 9){
        fill(255, 0, 0);
        rect(width/(n) *i, height/(n) *j, width/n, height/n);
      }else{
        fill(150);
        rect(width/(n) *i, height/(n) *j, width/n, height/n);
        fill(0);
        textAlign(LEFT, TOP);
        textSize( width/n);
        text(arr[j][i],width/(n) *i, height/(n) *j);
        
      }
      
    }
  }
  
  
}
void keyPressed(){
  if(key == 'f'){
    flag = true;
  }
  
}
void keyReleased(){
  if(key == 'f') flag = false;
}
void mouseReleased(){
  if(flag == false){
     setCubeW(mouseY/(800/n), mouseX/(800/n));
     setCubeE(mouseY/(800/n), mouseX/(800/n));
     setCubeN(mouseY/(800/n), mouseX/(800/n));
     setCubeS(mouseY/(800/n), mouseX/(800/n));
     setCubeNW(mouseY/(800/n), mouseX/(800/n));
     setCubeNE(mouseY/(800/n), mouseX/(800/n));
     setCubeSW(mouseY/(800/n), mouseX/(800/n));
     setCubeSE(mouseY/(800/n), mouseX/(800/n));
  } else{
    
  }
}

int checkMines(int row, int col){
  int numberOfMines = 0;

  if(row < n-1 && col < n-1 && arr[row+1][col + 1] == 9) numberOfMines++;
  if(col < n-1 && arr[row][col + 1] == 9) numberOfMines++;
  if(row > 0 && col < n-1 && arr[row-1][col + 1] == 9) numberOfMines++;
  if(row < n-1 && arr[row+1][col] == 9) numberOfMines++;
  if(row > 0 && arr[row-1][col] == 9) numberOfMines++;
  if(row < n-1 && col > 0 && arr[row +1][col - 1] == 9) numberOfMines++;
  if(col > 0 && arr[row][col - 1] == 9) numberOfMines++;
  if(row > 0 && col> 0 && arr[row-1][col - 1] == 9) numberOfMines++;
  
  
  return numberOfMines;
}

void setCubeW(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0 && currentCol != 1){
      
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
      
     setCubeW(currentRow, currentCol-1);
     //setCube(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCube(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}
void setCubeE(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
      
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
     //setCube(currentRow, currentCol-1);
     setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCube(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeN(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
      
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     setCubeN(currentRow-1, currentCol);
     //setCube(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeS(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
      
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     setCubeS(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeNW(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
      
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCubeS(currentRow+1, currentCol);
     setCubeNW(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeNE(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
     arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
      
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCubeS(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     setCubeNE(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeSW(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
           arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
      
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCubeS(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     setCubeSW(currentRow+1, currentCol-1);
  
   } 
   

}

void setCubeSE(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);

    if(checkMines(currentRow,currentCol) == 0){
      
           arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
     //setCube(currentRow, currentCol-1);
     //setCubeE(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCubeS(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     setCubeSE(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}
