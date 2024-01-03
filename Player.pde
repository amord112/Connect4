  public class Player{
  //attributes
  public char playerPiece; 
  public String name; 
  public color mycolor;
  
  //constructor
  Player(String name, char piece, color mycolor){
    this.name = name; 
    this.playerPiece = piece;
    this.mycolor = mycolor;
  }
 //create a turn where a random column is chose
 //the AI player will use this turn method
  void turn(Board board){
    int columnNum = (int)(Math.random()*7);
    if (board.checkFill(columnNum)){
         board.move(columnNum, currentPlayer.playerPiece);
       }
       board.drawBoard();
       switchPlayer();
       delay(750);
  }
  //create a turn where the piece is highlighted above a column when the player is thinking 
  //this method will be used by the Human player 
  void turn(){
        fill(this.mycolor);
        float x = 90;
        float w = 70;
        if(mouseX > x-30 && mouseX < x+30)
            ellipse(x, 185, 50, 50);
        else if(mouseX > x+w-30 && mouseX < x+w+30)
            ellipse(x+w, 185, 50, 50);
        else if(mouseX > x+2*w-30 && mouseX < x+2*w+30)
            ellipse(x+2*w, 185, 50, 50);
        else if(mouseX > x+3*w-30 && mouseX < x+3*w+30)
            ellipse(x+3*w, 185, 50, 50);
        else if(mouseX > x+4*w-30 && mouseX < x+4*w+30)
            ellipse(x+4*w, 185, 50, 50);
        else if(mouseX > x+5*w-30 && mouseX < x+5*w+30)
            ellipse(x+5*w, 185, 50, 50);
        else if(mouseX > x+6*w-30 && mouseX < x+6*w+30)
            ellipse(x+6*w, 185, 50, 50);
  }
}
