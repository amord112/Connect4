
public class Column{
  //attributes
  public static final int height = 6; 
  public int fill;
  int columnNum;
  public Square[] column;
  
  //constructors
  Column(int columnNum){
    this.fill = 0;
    this.columnNum = columnNum;
    this.column = new Square[height];
    for(int i=0; i<height; i++) {
      column[i] = new Square(columnNum, i, ' ');
    }
  }
  
  //method to get the char at a position
  public char charAt(int i) {
    return column[i].getStatus();
  }
}
