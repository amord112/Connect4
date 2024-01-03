class Board{
  //declare attributes
  int width = 7;  
  Column[] board = new Column[width]; 
  
  //create constructor
  Board(){
    for(int i=0; i<this.width; i++) {
      Column col = new Column(i);
      board[i] = col; 
    }
  }
  //drawBoard method - draws board containing player pieces 
  public void drawBoard() {
    fill(209, 225, 232);
    rect(50, 150, 500, 68);
    for(int i=0; i<6; i++) {
      for(int j=0; j<7 ; j++) {
        float x = 90 + j * 70;
        float y = 600 - i * 70;
        
        if(board[j].charAt(i) == ' '){
          fill(255, 255, 255);
          ellipse(x, y, 50, 50);
        }
        else if (board[j].charAt(i) == 'X') {
          fill(player1.mycolor);
          ellipse(x, y, 50, 50);
        } 
        else if (board[j].charAt(i) == '0') {
          fill(player2.mycolor);
          ellipse(x, y, 50, 50);
        }
      }
    }
  } 
  //method to determine if a piece is a winning piece 
  public boolean checkWinningCircle(int[] circle){
    int[][] location = getLocation();
    boolean check = false;
    for(int i=0; i<4; i++){
      if (location[i][0]== circle[0] && location[i][1] == circle[1]){
        check = true;
      }
    }
    return check;
  }
  //method to draw winning board
  //winning pieces will flash 
  public void drawWinningBoard(){
    fill(209, 225, 232);
    rect(50, 150, 500, 50);
    for(int i=0; i<6; i++) {
      for(int j=0; j<7 ; j++) {
        float x = 90 + j * 70;
        float y = 600 - i * 70;
        int[] circle = {i,j};
        
        if (checkWinningCircle(circle)) {
        if (frameCount % 50 < 25) {
          if (board[j].charAt(i) == 'X') {
            fill(player1.mycolor);
          } else if (board[j].charAt(i) == '0') {
            fill(player2.mycolor);
          }
        } else {
          fill(255, 255, 255);
        }
      } else if (board[j].charAt(i) == ' ') {
        fill(255, 255, 255);
      } else if (board[j].charAt(i) == 'X') {
        fill(player1.mycolor);
      } else if (board[j].charAt(i) == '0') {
        fill(player2.mycolor);
      }
      ellipse(x, y, 50, 50);
        }
      }
    }
 //method to check whether a column is filled up 
  public boolean checkFill(int col){
    if (board[col].fill == Column.height){
      return false; 
    }
    else{
      return true;
    }
  }
  //method move - fills a column with a piece when a player places it there
  public void move(int columnNum, char piece) {
    Column col = board[columnNum];
    int row = board[columnNum].fill;
    col.column[row].setLabel(piece);
    col.fill ++;
  }
  //method to check for win - checks for four in a row in a column, row, and diagonal
  public boolean checkWin() {
    BoardArray boardArray = new BoardArray(board);
    int[][] vertical = boardArray.checkCol();
    int[][] horizontal = boardArray.checkRow();
    int[][] diagonalRight = boardArray.checkDiagonalRight();
    int[][] diagonalLeft = boardArray.checkDiagonalLeft();
    if(vertical[0][0] != -1
            || horizontal[0][0] != -1
            || diagonalRight[0][0] != -1
            || diagonalLeft[0][0] != -1){
              return true;}   
     else{
       return false;
     }
  }
  //method to check for a tie - checks if the board is full
  public boolean checkTie(){
    int totalFill = 0;
    for(int i=0; i<7; i++){
        totalFill += board[i].fill;
    }
    if(totalFill == 42){
      return true;
    }
    else{
      return false;
    }
  }
  //method that returns the location of the first winning piece and the direction of the other 3 (up, right, diagonal left or diagonal right)
  public int[][] getLocation(){
    int[][] location = new int[4][2];
    BoardArray boardArray = new BoardArray(board);
    int[][] vertical = boardArray.checkCol();
    int[][] horizontal = boardArray.checkRow();
    int[][] diagonalRight = boardArray.checkDiagonalRight();
    int[][] diagonalLeft = boardArray.checkDiagonalLeft();
    if(vertical[0][0] != -1){
      return vertical;
    }
    else if(horizontal[0][0] != -1){
      return horizontal;
    }
    else if(diagonalRight[0][0] != -1){
      return diagonalRight;
    }
    else if(diagonalLeft[0][0] != -1){
      return diagonalLeft;
    }
    return location;
  }
}
