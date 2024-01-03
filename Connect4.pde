import processing.sound.*;

  //create player objects
  Player player1;
  Player player2;
  //declare currentPlayer and otherPlayer - this is to determine who wins and which color pieces should be played 
  Player currentPlayer;
  Player otherPlayer;
  Board board;
  //declare title and gameover variables - this is to determine what to print at each stage of the game 
  Boolean gameover = false;
  Boolean title = true;
  int mode;
  //set colors for each player
  color p1c;
  color p2c;
  
  void setup() {
    size(600, 700);
    background(255);
    textSize(20);
    textAlign(CENTER);
  
    p1c = color(191,94,186);
    p2c = color(230, 180, 250);
    player1 = new Player("Player 1", 'X', p1c);
    player2 = new Player("Player 2", '0', p2c);
    currentPlayer = player1;
    otherPlayer = player2;
    board = new Board();    
  }
  
  void draw() {
    //draw title page to allow user to pick which mode they want to play 
    if(title){
      fill(0, 0, 25);
      background(255);
      fill(0);
      text("CONNECT 4", width/2, 50);
      text("Choose your mode:", width/2, 200);
      if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 225 && mouseY < 275){
         fill(191,94,186);
         text("Human VS Human", width/2, 250);
      }
      //change color of text when user hovers over text
      else{
         fill(0);
         text("Human VS Human", width/2, 250);
        }
      if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 275 && mouseY < 325){
        fill(191,94,186);
        text("Human VS AI", width/2, 300);
      }
      else{
         fill(0);
         text("Human VS AI", width/2, 300);
        }
      if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 325 && mouseY < 375){
        fill(191,94,186);
        text("AI VS AI", width/2, 350);
      }
      else{
         fill(0);
         text("AI VS AI", width/2, 350);
        }
    }
    //print board if the title page is over 
    if(title==false){
      fill(209, 225, 232);
      background(255);
      rect(50, 150, 500, 500);
      fill(0);
      text("CONNECT 4", width/2, 50);
      text(currentPlayer.name + ", place the piece in your column of choice.", width/2, 80);
      fill(0);
      text("A               B               C               D               E               F               G", width/2, 140);
      
      board.drawBoard();
      if(gameover == false){
        if(mode==1 || (mode == 2 && currentPlayer == player1)){
          currentPlayer.turn();
        }
        else{
          if(! board.checkWin()){
            currentPlayer.turn(board);
            board.drawBoard();
          }
        }
      }
      //check if the players tied. then print the end board and declare tie
      if (board.checkTie()) {
        gameover = true;
        fill(209, 225, 232);
        background(255);
        rect(50, 150, 500, 500);
        fill(0);
        text("CONNECT 4", width/2, 50);
        text("It's a TIE!", width/2, 80);
        fill(0);
        text("A               B               C               D               E               F               G", width/2, 140);
    
        board.drawBoard();
        switchPlayer();
      }
      //check if one of the players has won. then print the end board and declare the winner
      if (board.checkWin()) {
        gameover = true;
        fill(209, 225, 232);
        background(255);
        rect(50, 150, 500, 500);
        fill(0);
        text("CONNECT 4", width/2, 50);
        text(otherPlayer.name + " WINS!", width/2, 80);
        fill(0);
        text("A               B               C               D               E               F               G", width/2, 140);
        board.drawWinningBoard();
      }
    }
  }
   //method to switch currentPlayer and otherPlayer 
   void switchPlayer() {
    if(currentPlayer == player1){
      currentPlayer = player2;
      otherPlayer = player1;
    }
    else if(currentPlayer == player2){
      currentPlayer = player1;
      otherPlayer = player2;
    }
   }
   void mouseClicked(){
     //for the title page, check which mode the user has chosen 
     if(title){
       if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 225 && mouseY < 275){
         title = false;
         mode = 1;
       }
       else if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 275 && mouseY < 325){
         title = false;
         mode = 2;
       }
       else if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 325 && mouseY < 375){
         title = false;
         mode = 3;
       }
     }
     
     else if(gameover == false && title == false){
     //set the column number and widths of the columns
     int columnNum = 1;
     float x = 90;
     float w = 70;
     //check which column the user has clicked
     if(mouseX > x-35 && mouseX < x+6*w+35){
       if(mouseX > x-35 && mouseX < x+35)
          columnNum = 0;
       else if(mouseX > x+w-35 && mouseX < x+w+35)
          columnNum = 1;
       else if(mouseX > x+2*w-35 && mouseX < x+2*w+35)
          columnNum = 2;
       else if(mouseX > x+3*w-35 && mouseX < x+3*w+35)
          columnNum = 3;
       else if(mouseX > x+4*w-35 && mouseX < x+4*w+35)
          columnNum = 4;
       else if(mouseX > x+5*w-35 && mouseX < x+5*w+35)
          columnNum = 5;
       else if(mouseX > x+6*w-35 && mouseX < x+6*w+35)
          columnNum = 6;
 
        if (board.checkFill(columnNum)){
          board.move(columnNum, currentPlayer.playerPiece);
          switchPlayer();
          board.drawBoard();
       }
     }
     }
   } 
