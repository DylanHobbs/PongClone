Player thePlayer;
Player playerTwo;
Ball theBall;
Ball ball2;
int gameState = 0;
int time = 1;
void setup() {
  background(0,0,255);
  size(SCREENX, SCREENY);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  playerTwo = new Player(0-MARGIN+PADDLEHEIGHT);
  theBall = new Ball();
  ball2 = new Ball();
  ellipseMode(RADIUS);
}
void draw() {
  if (gameState == 0) {
    textAlign(CENTER, TOP);
    textSize(45);
    //fontColor(0,0,0);
    text("Welcome to Pong", SCREENX / 2, 100); 
    //textAlign(CENTER, BOTTOM);
    textSize(20);
    text("The game ends when \neither player scores 3 points.\n Press any key to begin", SCREENX / 2, 280);
  }
  if (gameState == 1) {
    background(255);
    thePlayer.move(mouseX);
    theBall.move();
    ball2.move();
    playerTwo.move2();
    theBall.collide(thePlayer);
    theBall.collide(playerTwo);
    theBall.collideWall();
    ball2.collide(thePlayer);
    ball2.collide(playerTwo);
    ball2.collideWall();
    ball2.draw();
    thePlayer.draw();
    theBall.draw();
    playerTwo.draw();
    theBall.reset();
    time++;
  } else if (gameState == 2) {
    textAlign(CENTER, CENTER);
    textSize(45);
    text("Game Over", SCREENX / 2, SCREENY / 2);
  } else if (gameState == 3) {
    textAlign(CENTER, CENTER);
    textSize(45);
    text("You Won", SCREENX / 2, SCREENY / 2);
  }
}

void keyPressed() {
  gameState = 1;
}


