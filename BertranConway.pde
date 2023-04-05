CA c;

void setup() {
  size(640, 480);
  c = new CA(60, 80);
  frameRate(10);
}

void draw() {
  c.run();
}

void mousePressed() {
  c.toggleCells(mouseX / 8, mouseY / 8);
}

void keyPressed() {
  if (key == ' ') {
    c.startGame();
  }
  if (key == 'g') {
    c.gosper();
  }
  if (key == 'p') {
    c.penta();
  }
}
