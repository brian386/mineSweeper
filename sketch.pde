ArrayList<Square> sList;
int n = 30;

int[][] arr = new int[n][n];

void setup(){
  size(800, 800);
  sList = new ArrayList<Square>();
  for(int i = 0; i < n; i++){
    for(int j = 0; j< n; j++){
      int rand = (int) random(4);
      
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

void mouseReleased(){
   setCube(mouseY/(800/n), mouseX/(800/n));



}

int checkMines(int row, int col){
  int numberOfMines = 0;
  if(row < n-1 && col < n-1 && arr[row+1][col + 1] == 9) numberOfMines++;
  if(col < n-1 && arr[row][col + 1] == 9) numberOfMines++;
  if(row > 0 && col < n-1 && arr[row-1][col + 1] == 9) numberOfMines++;
  if(row < n-1 && arr[row+1][col] == 9) numberOfMines++;
  if(row > 0 && arr[row -1][col] == 9) numberOfMines++;
  if(row < n-1 && col > 0 && arr[row +1][col - 1] == 9) numberOfMines++;
  if(col > 0 && arr[row][col - 1] == 9) numberOfMines++;
  if(row > 0 && col> 0 && arr[row-1][col - 1] == 9) numberOfMines++;
  
    
  
  return numberOfMines;
}

void setCube(int _row, int _col){
  int currentRow = _row;
  int currentCol = _col;
  arr[currentRow][currentCol] = checkMines(currentRow, currentCol);
  //for(int i = 0; i < n; i++){
  //  for(int j = 0; j < n; j++){
  //    print(arr[i][j] + " ");
  //    if(j % n == n-1){
  //      println();
  //    }
  //  }
  // }
    if(checkMines(currentRow,currentCol) == 0){
     //arr[currentRow][currentCol-1] = checkMines(currentRow, currentCol-1);
     //arr[currentRow][currentCol+1] = checkMines(currentRow, currentCol+1);
     //arr[currentRow-1][currentCol] = checkMines(currentRow-1, currentCol);
     //arr[currentRow+1][currentCol] = checkMines(currentRow+1, currentCol);
     //arr[currentRow-1][currentCol-1] = checkMines(currentRow-1, currentCol-1);
     //arr[currentRow+1][currentCol+1] = checkMines(currentRow+1, currentCol+1);
     //arr[currentRow-1][currentCol+1] = checkMines(currentRow-1, currentCol+1);
     //arr[currentRow+1][currentCol-1] = checkMines(currentRow+1, currentCol-1);
     
     setCube(currentRow, currentCol-1);
     //setCube(currentRow, currentCol+1);
     //setCube(currentRow-1, currentCol);
     //setCube(currentRow+1, currentCol);
     //setCube(currentRow-1, currentCol-1);
     //setCube(currentRow+1, currentCol+1);
     //setCube(currentRow-1, currentCol+1);
     //setCube(currentRow+1, currentCol-1);
  
   } 
   

}
