public class BoardArray extends Board{
  //attributes
  public Square[][] boardArray; 
  
  //constructor
  BoardArray(Column[] board){
    this.boardArray = new Square[width][Column.height];
    
    for(int i=0; i<width; i++) {
      for(int j=Column.height-1; j>=0; j--) {
        boardArray[i][j] = new Square(i,j,board[i].charAt(j));
      }
    }
  }
  //method to check for 4 in a column 
  public int[][] checkCol() {
    int[][] locations = new int[4][2];
    for(int i=0; i<4; i++){
      for(int j=0; j<2; j++){
        locations[i][j] = -1;
      }
    }
    //loop through all columns and pieces in a column to check if the next 3 are of the same piece
    //return all locations of the winning pieces
    for(int i=0; i<width; i++) {
      for(int j=0; j<= Column.height - 4; j++) {
        if (boardArray[i][j].getStatus() != ' '
          && boardArray[i][j].getStatus() == boardArray[i][j+1].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i][j+2].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i][j+3].getStatus()) {
          for(int x=0; x<4;x++){
            locations[x][0] = j+x;
            locations[x][1] = i;
          }
        }
      }
    }
    return locations;
  }
  //method to check for 4 in a row in a row 
  public int[][] checkRow() {
    int[][] locations = new int[4][2];
    for(int i=0; i<4; i++){
      for(int j=0; j<2; j++){
        locations[i][j] = -1;
      }
    }
    //loop through each row and each piece until the next 3 are of the same piece 
    //return all locations of the winning pieces
    for(int i=0; i<= width-4; i++) {
      for(int j=0; j< Column.height; j++) {
        if (boardArray[i][j].getStatus() != ' '
          && boardArray[i][j].getStatus() == boardArray[i+1][j].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i+2][j].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i+3][j].getStatus()) {
          for(int x=0; x<4;x++){
            locations[x][0] = j;
            locations[x][1] = i+x;
          }
        }
      }
    }
    return locations;
  }
  
  //method to check for 4 in a row in a diagonal going to the right 
  public int[][] checkDiagonalRight() {
    int[][] locations = new int[4][2];
    for(int i=0; i<4; i++){
      for(int j=0; j<2; j++){
        locations[i][j] = -1;
      }
    }
    //loop through every piece lower than the board height - 4, and before board width - 4
    //return all locations of the winning pieces 
    for(int i=0; i< width-3; i++) {
      for(int j=0; j<= Column.height - 4; j++) {
        if (boardArray[i][j].getStatus() != ' '
          && boardArray[i][j].getStatus() == boardArray[i+1][j+1].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i+2][j+2].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i+3][j+3].getStatus()) {
          for(int x=0; x<4;x++){
            locations[x][0] = j+x;
            locations[x][1] = i+x;
          }
        }
      }
    }
    return locations;
  }
  //method to check for 4 in a row in a diagonal going to the left
  public int[][] checkDiagonalLeft() {
    int[][] locations = new int[4][2];
    for(int i=0; i<4; i++){
      for(int j=0; j<2; j++){
        locations[i][j] = -1;
      }
    }
    //loop through every piece lower than the board height - 4, and after the 4th column
    //return all locations of the winning pieces 
    for(int i=3; i<width; i++) {
      for(int j=0; j<= Column.height - 4; j++) {
        if (boardArray[i][j].getStatus() != ' '
          && boardArray[i][j].getStatus() == boardArray[i-1][j+1].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i-2][j+2].getStatus()
          && boardArray[i][j].getStatus() == boardArray[i-3][j+3].getStatus()) {
          for(int x=0; x<4;x++){
            locations[x][0] = j+x;
            locations[x][1] = i-x;
          }
        }
      }
    }
    return locations;
  }
}
