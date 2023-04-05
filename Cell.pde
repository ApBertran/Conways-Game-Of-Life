public class Cell {
  private boolean isAlive;
  private int x;
  private int y;
  private int age = 0;

  public Cell(int x, int y) {
    isAlive = false;
    this.x = x;
    this.y = y;
  }

  public Cell(int x, int y, boolean isAlive, int age) {
    this.x = x;
    this.y = y;
    this.isAlive = isAlive;
    this.age = age;
  }

  public boolean isAlive() {
    return this.isAlive;
  }
  public int getAge() {
    return this.age;
  }

  public void toggleLife() {
    isAlive = isAlive ? false : true;
    if (!isAlive) {
      age = 0;
    }
  }

  public void age() {
    age++;
  }

  public void render() {
    if (isAlive) {
      if (age < 2) {
        fill(0, 255, 0);
      } else if (age >= 2 && age < 4) {
        fill(255, 255, 0);
      } else {
        fill(255, 0, 0);
      }
    } else {
      fill(0);
    }
    rect(x*8, y*8, 8, 8);
  }
}
