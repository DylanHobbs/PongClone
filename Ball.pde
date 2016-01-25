
class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  int radius;
  color ballColor = color(192, 168, 1);
  float lastBallPosx;
  float lastBallPosy;
  boolean ballLeft;
  boolean ballRight;
  int friction = 40;

  Ball() {
    x = random(SCREENX/4, SCREENX/2) + 1;
    y = random(SCREENY/4, SCREENY/2) + 1;
    dx = random(-2, 2);
    dy = random(1, 3);
    radius = 5;
    lastBallPosx = x;
    lastBallPosy = y;
  }
  void move() {
    x = x + dx;
    y = y + dy;
    if (lastBallPosx >= x) {
      ballLeft = true;
      ballRight = false;
      //println("left"); //Detection testing
    } else if (lastBallPosx < x) {
      ballLeft = false;
      ballRight = true;
      //println("right"); //Detection testing
    }
    lastBallPosx = x;
    lastBallPosy = y;
  }
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }

  void collide(Player tp) {
    if (y+radius >= tp.ypos &&
      y-radius < tp.ypos+PADDLEHEIGHT &&
      x >= tp.xpos &&
      x <= tp.xpos+PADDLEWIDTH) {
      //println("collided!");
      dy = -dy;
      dx = dx + (thePlayer.pdx);
      dy = dy * 1.1; 
      if (thePlayer.left && theBall.ballLeft) {
        dx = -dx;
        //println("test"); //Detection testing
      } else if (thePlayer.right && theBall.ballLeft) {
        dx = dx;
        //println("test2"); //Detection testing
      } else if (thePlayer.left && theBall.ballRight) {
        dx = -dx;
        //println("test3"); //Detection testing
      } else if (thePlayer.right && theBall.ballRight) {
        dx = dx;
      }
    }
  }

  void collideWall() {
    if (x > SCREENX || x < 0) {
      dx = -dx ;
    }
  }

  void reset() {
    //Seperate this to add in wins and losses
    if (y > SCREENY) {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = 0;
      dy = 0;
      radius = 5;
      thePlayer.lifeLost();
    }
    if (y < 0) {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = 0;
      dy = 0;
      radius = 5;
      thePlayer.playerWin();
    }
  }

  void restart() {
    dx = random(-2, 2);
    dy = random(1, 3);
  }
}

