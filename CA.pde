public class CA {
  private Cell[][] current;
  private boolean go;

  public CA(int x, int y) {
    current = new Cell[x][y];
    go = false;

    for (int i = 0; i < current.length; i++) {
      for (int j = 0; j < current[i].length; j++) {
        current[i][j] = new Cell(j, i);
      }
    }
  }

  public void startGame() {
    go = true;
  }

  public void run() {
    renderCells();
    if (go) {
      countLife();
      calculateNextGeneration();
    }
  }

  public void toggleCells(int x, int y) {
    current[y][x].toggleLife();
  }

  public void gosper() {
    if (!go) {
      current[20][20].toggleLife();
      current[21][20].toggleLife();
      current[20][21].toggleLife();
      current[21][21].toggleLife();

      current[20][30].toggleLife();
      current[21][30].toggleLife();
      current[22][30].toggleLife();
      current[23][31].toggleLife();
      current[19][31].toggleLife();
      current[18][32].toggleLife();
      current[24][33].toggleLife();
      current[18][33].toggleLife();
      current[24][32].toggleLife();
      current[21][34].toggleLife();
      current[19][35].toggleLife();
      current[23][35].toggleLife();
      current[22][36].toggleLife();
      current[21][36].toggleLife();
      current[20][36].toggleLife();
      current[21][37].toggleLife();

      current[20][40].toggleLife();
      current[19][40].toggleLife();
      current[18][40].toggleLife();
      current[20][41].toggleLife();
      current[19][41].toggleLife();
      current[18][41].toggleLife();
      current[17][42].toggleLife();
      current[21][42].toggleLife();

      current[21][44].toggleLife();
      current[22][44].toggleLife();

      current[17][44].toggleLife();
      current[16][44].toggleLife();

      current[18][54].toggleLife();
      current[19][54].toggleLife();
      current[18][55].toggleLife();
      current[19][55].toggleLife();
    }
  }

  public void penta() {
    if (!go) {
      current[20][30].toggleLife();
      current[20][31].toggleLife();
      current[20][32].toggleLife();
      current[19][32].toggleLife();
      current[21][32].toggleLife();

      current[20][35].toggleLife();
      current[19][35].toggleLife();
      current[21][35].toggleLife();
      current[20][36].toggleLife();
      current[20][37].toggleLife();
      current[20][38].toggleLife();
      current[20][39].toggleLife();
      current[20][40].toggleLife();
      current[19][40].toggleLife();
      current[21][40].toggleLife();

      current[20][43].toggleLife();
      current[19][43].toggleLife();
      current[21][43].toggleLife();
      current[20][44].toggleLife();
      current[20][45].toggleLife();
    }
  }

  private void countLife() {
    for (Cell[] cells : current) {
      for (Cell c : cells) {
        c.age();
      }
    }
  }

  private void renderCells() {
    for (Cell[] cells : current) {
      for (Cell c : cells) {
        c.render();
      }
    }
  }

  private void calculateNextGeneration() {
    Cell[][] next = new Cell[current.length][current[0].length];

    for (int i = 0; i < current.length; i++) {
      for (int j = 0; j < current[i].length; j++) {
        int neighbors = countLivingNeighbors(i, j);
        if (current[i][j].isAlive()) {
          if (neighbors == 2 || neighbors == 3) {
            next[i][j] = new Cell(j, i, true, current[i][j].getAge());
          } else {
            next[i][j] = new Cell(j, i, false, 0);
          }
        } else {
          if (neighbors == 3) {
            next[i][j] = new Cell(j, i, true, 0);
          } else {
            next[i][j] = new Cell(j, i, false, 0);
          }
        }
      }
    }

    current = next;
  }

  private int countLivingNeighbors(int r, int c) {
    int count = 0;

    // upper-left
    if (r >= 1 && c >= 1) {
      if (current[r-1][c-1].isAlive()) { count++; }
    } else if (r >= 1) {
      if (current[r-1][current[0].length-1].isAlive()) { count++; }
    } else if (c >= 1) {
      if (current[current.length-1][c-1].isAlive()) { count++; }
    }
    
    // top
    if (r >= 1) {
      if (current[r-1][c].isAlive()) { count++; }
    } else {
      if (current[current.length-1][c].isAlive()) { count++; }
    }
    
    // upper-right
    if (r >= 1 && c < current[0].length-1) {
      if (current[r-1][c+1].isAlive()) { count++; }
    } else if (r >= 1) {
      if (current[r-1][0].isAlive()) { count++; }
    } else if (c < current[0].length-1) {
      if (current[current.length-1][c+1].isAlive()) { count++; }
    }
    
    // left
    if (c >= 1) {
      if (current[r][c-1].isAlive()) { count++; }
    } else {
      if (current[r][current[0].length-1].isAlive()) { count++; }
    }
    
    // right
    if (c < current[0].length - 1) {
      if (current[r][c+1].isAlive()) { count++; }
    } else {
      if (current[r][0].isAlive()) { count++; }
    }
    
    // lower-left
    if (r < current.length - 1 && c >= 1) {
      if (current[r+1][c-1].isAlive()) { count++; }
    } else if (r < current.length - 1) {
      if (current[r+1][current[0].length - 1].isAlive()) { count++; }
    } else if (c >= 1) {
      if (current[0][c-1].isAlive()) { count++; }
    }
    
    // lower
    if (r < current.length - 1) {
      if (current[r+1][c].isAlive()) { count++; }
    } else {
      if (current[0][c].isAlive()) { count++; }
    }
    
    // lower-right
    if (r < current.length - 1 && c < current[0].length - 1) {
      if (current[r+1][c+1].isAlive()) { count++; }
    } else if (r < current.length - 1) {
      if (current[r+1][0].isAlive()) { count++; }
    } else if (c < current[0].length - 1) {
      if (current[0][c+1].isAlive()) { count++; }
    }

    return count;
  }
}
