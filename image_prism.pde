static HashMap<String, PImage> imageFileCache = new HashMap<String, PImage>();

//***************************************************************
// helper function, checks if the image file has been loaded,
// uses already loaded object iff it has.  Loads file and stores
// it in the hash map if not, and returns it.
//***************************************************************
PImage loadCachedPNGFile(String filename) {
  PImage imageFile;
  //println("loadCachedPNGFile: " + filename);
  if(imageFileCache.containsKey(filename)) {
    //println("loading from cache.");
    imageFile = imageFileCache.get(filename);
  } else {
    //println("loading from disk.");
    imageFile = loadImage(filename);
    imageFileCache.put(filename, imageFile);
  }

  return imageFile;
}

PImage bkgrndImg;

int last_millis;

float cx1, cx2, cy1, cy2, w, h;

float t;

void setup() {
  size(800,600,P2D);
  bkgrndImg = loadImage("img01.jpg");
  
  noStroke();
  
  cx1 = 400;
  cy1 = 400;
  
  cx2 = 200;
  cy2 = 200;
  
  w = 50;
  h = 50;

  last_millis = millis();
}

void draw() {
  image(bkgrndImg, 0, 0, width, height);
  int cur_millis = millis();
  float dt = (cur_millis - last_millis)/1000.0;
  last_millis = cur_millis;

  t += dt;

  beginShape(QUADS);
    texture(bkgrndImg);
    vertex((cx1+100*cos(t))-w/2,(cy1+100*sin(t))-h/2,(cx1-100*cos(t))-(cy1-100*sin(t)),cy2-h/2);
    vertex((cx1+100*cos(t))+w/2,(cy1+100*sin(t))-h/2,(cx1-100*cos(t))+(cy1-100*sin(t)),cy2-h/2);
    vertex((cx1+100*cos(t))+w/2,(cy1+100*sin(t))+h/2,(cx1-100*cos(t))+(cy1-100*sin(t)),cy2+h/2);
    vertex((cx1+100*cos(t))-w/2,(cy1+100*sin(t))+h/2,(cx1-100*cos(t))-(cy1-100*sin(t)),cy2+h/2);
  endShape();

}
