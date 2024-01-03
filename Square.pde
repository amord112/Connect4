public class Square{
  //attributes
  public int x; 
  public int y; 
  char label; 
  
  //constructor
  Square(int x, int y, char status){
    this.x = x;
    this.y = y; 
    this.label = status; 
  }
  
  //method to change the status
  public void setStatus(char status) {
    this.label = status; 
  }
  
  //method to get the status
  public char getStatus() {
    return this.label; 
  }
  
  //method to get label
  public char getStatusl() {
    return this.label;
  }
  
  //method to set label
  public void setLabel(char label) {
    this.label = label; 
  }
  
}
