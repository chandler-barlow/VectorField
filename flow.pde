float scl = 10;
float inc = .01;
float zoff = 0;
float count = 0;
int cols, rows;

void setup(){
  size(700,700, P2D);
  cols = (int)(width / scl);
  rows = (int)(height / scl);
  pixelDensity(displayDensity());
  
      
      
  
}
void draw(){
  background(0);
   float yoff = 0;
   for (int y = 0; y < rows; y++){
     float xoff = 0;
     for(int x = 0; x < cols; x++){
      int index = x + y*width;
      float angle = (noise(xoff, yoff, zoff) * 255) / TWO_PI;
      PVector v = new PVector().fromAngle(angle);
      xoff += inc;
      colorMode(HSB);
      //strokeWeight(2);
      stroke(245 - noise(xoff, yoff, zoff) * 100, 255, 255);
      pushMatrix();
      translate(x * scl, y * scl);
      rotate(v.heading());
      
      line(0,0 , scl, 0);
      
      popMatrix();
      count += .01;
      
     }
   yoff += inc;
   }
   
   zoff += .001;
   println(frameRate);
}
