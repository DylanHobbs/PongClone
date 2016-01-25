class Player {
  int xpos; 
  int ypos;
  color paddlecolor = color(0);
  int playerLives = 3;
  int playerWins = 0;
  int computerWins = 0;
  float pdx;
  boolean left;
  boolean right;
  int lastPos;
  int lastTime;
  Player(int screen_y) {
    xpos = SCREENX/2;
    ypos = screen_y;
    //lastPos = xpos;
    //lastTime = time;
  }

  void move(int x) {
    if (x > SCREENX-PADDLEWIDTH) {
      xpos = SCREENX-PADDLEWIDTH;
    } else {
      xpos=x;
    }
    int timeDiff = time - lastTime;
    if (timeDiff > 0) {
      pdx = (xpos - lastPos) / timeDiff;
    } else {
      pdx = 0;
    }
    pdx = abs(pdx);
    //println (pdx);
    //pdx = xpos / time;
    if (lastPos >= xpos) {
      left = true;
      right = false;
      //println("left"); //Detection testing
    } else if (lastPos < xpos) {
      right = true; 
      left = false;
      //println("right"); //Detection testing
    }
    lastPos = xpos;
    lastTime = time;
  }

  void move2() {
    float positionx = theBall.x;  //(int) theBall.x;
    if (positionx > xpos) {
      xpos+=10;
    } else if (positionx < xpos) {
      xpos-=10;
    }
    if (xpos >= SCREENX-PADDLEWIDTH) {
      xpos = SCREENX-PADDLEWIDTH;
    }
  }

  void lifeLost() {
    playerLives--;
    if (playerLives == 0) {
      gameState = 2;
    } else {
      println("You lost a life! You now have " + playerLives + " lives remaining");
    }
  }

  void playerWin() {
    playerWins++;
    if (playerWins == 3) {
      gameState = 3;
    } else {
      println("You scored a point! You have a total of " + playerWins + " points");
    }
  }

  void draw() {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}

