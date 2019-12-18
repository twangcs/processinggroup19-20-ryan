  /*
  DVD
  - Ryan Lee
  
  DVD screensaver which changes colors with each bounce
  Cool animation to make
  */
  
  screensaver dvdImg;
        
  void setup(){
    size(1000, 750);
    dvdImg = new screensaver();
  }
  
  void draw(){
    dvdImg.move();
  }
  
  public class screensaver {
    private PImage dvd;
    private float x;
    private float y;
    private int xSpeed = 2;
    private int ySpeed = 2;
    private color[] col;
    private int num;
    
    public screensaver(){
      dvd = loadImage("dvd.png");
      x = random(width);
      y = random(height);
      num = 0;
    }
    
    public void chooseColor(){
      int index;
      color choose;
      
      color r = color(255, 0, 0);
      color o = color(255, 145, 0);
      color y = color(255, 239, 0);
      color g = color(0, 255, 26);
      color b = color(0, 200, 255);
      color i = color(0, 100, 255);
      color v = color(200, 0, 255);
      
      col = new color[]{r, o, y, g, b, i, v};
      
      do {
      index = Math.round(random(6)); 
      choose = col[index];
      } while(num == index);
      
      num = index;
      tint(red(choose), green(choose), blue(choose));
    }
    
    public void move(){
      background(0);
      image(dvd, x, y);
      x += xSpeed;
      y += ySpeed;
      
      if (x + dvd.width >= width){
        xSpeed = -xSpeed;
        x = width - dvd.width;
        chooseColor();
      }
      else if (x <= 0){
        xSpeed = -xSpeed;
        x = 0;
        chooseColor();
      }
      
      if (y + dvd.height >= height){
        ySpeed = -ySpeed;
        y = height - dvd.height;
        chooseColor();
      }
      else if (y <= 0){
        ySpeed = -ySpeed;
        y = 0;      
        chooseColor();
      }
    }
  }
  
