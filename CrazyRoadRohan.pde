/* 
 Name: Rohan Bhanot 
 Date: Thursday, June 2, 2022
 File Name: CrazyRoad
 Purpose: The objective of the game is to have a car which avoids contact with moving obstacles. 
 If the car collides with an obstacle, the player loses a life, but the score increases when the 
 top of the obstacle reaches the bottom of the screen. The more obstacles you avoid, the better 
 your game will be.
 ICS2O1
 */

/* Variable Table
 x - coordinate of the car
 y - coordinate of the car
 r - radius
 r2 - radius 2
 r3 - radius 3
 font - font used
 points - point counter
 lives - life counter
 by - background coordinate
 stage - stages
 stage 0 - menu screen
 stage 1 - help screen
 stage 2 - play screen
 stage 3 - lost screen
 stage 4 - reset screen
 cY1 - coordinate of the obstacle 1
 cX1 - coordinate of the obstacle 1
 s1 - speed of the obstacle 1
 cY2 - coordinate of the obstacle 2
 cX2 - coordinate of the obstacle 2
 s2 - speed of the obstacle 2
 cY3 - coordinate of the obstacle 3
 cX3 - coordinate of the obstacle 3
 s3 - speed of the obstacle 3
 cY4 - coordinate of the obstacle 4
 cX4 - coordinate of the obstacle 4
 s4 - speed of the obstacle 4
 cY5 - coordinate of the obstacle 5
 cX5 - coordinate of the obstacle 5
 s5 - speed of the obstacle 5
 */

// Variable Declaration

//car movement 
float x = 220; //x coordinate of the car
float y = 495; //y coordinate of the car
//obstacle 1
float cY1 = random(-150, -20); //y coordinate of the obstacle 1
float cX1 = random(80, 325); //x coordinate of the obstacle 1
float s1 = random(4, 7); //speed of the obstacle 1
//obstacle 2
float cY2 = random(-150, -20); //y coordinate of the obstacle 2
float cX2 = random(80, 325); //x coordinate of the obstacle 2
float s2 = random(4, 7); //speed of the obstacle 2
//obstacle 3 
float cY3 = random(-150, -20); //y coordinate of the obstacle 3
float cX3 = random(250, 325); //x coordinate of the obstacle 3
float s3 = random(4, 7); //speed of the obstacle 3
//obstacle 4 
float cY4 = random(-150, -20); //y coordinate of the obstacle 4
float cX4 = random(80, 180); //x coordinate of the obstacle 4
float s4 = random(4, 7); //speed of the obstacle 4
//obstacle 5
float cY5 = random(-150, -20); //y coordinate of the obstacle 5
float cX5 = random(340, 380); //x coordinate of the obstacle 5
float s5 = random(4, 7); //speed of the obstacle 5
//images
PImage car; //main car with movement
PImage rock; //rock obstacle
PImage pylon; //pylon obstacle
PImage car1; //car obstacle
PImage car2; //car obstacle
PImage raccoon; //animal obstacle
PImage scrollingRoad; //background scrolling road
PImage road; //background of firstScreen
PImage crazyRoadLogo; //the logo of the game
PImage play; //the button for play text
PImage help; //the button for help text
PImage back; //the button for back
PImage mainMenu; //the button for main menu text
PImage gameOver; //the text that appears when you lose the game
PImage instructions; //the text that tells you how to play the game
//radius 1 & 2
float r = 42.5; //radius for cars
float r2 = 22.5; //radius for pylon and rock
float r3 = 45; //radius for raccoon
//points and lives
int points=0; //points tracker
int lives=3; //lives tracker
//font
PFont font; //font used for text
//background coordinates
int by = -1000; //scrolling background coordinates
//stages
int stage = 0; //stage declaration

// Setup Before the Loop

void setup() {
  car = loadImage("car.png");
  rock = loadImage("rock.png");
  pylon = loadImage("pylon.png");
  car1 = loadImage("car1.png");
  car2 = loadImage("car2.png");
  raccoon = loadImage("raccoon.png");
  font = loadFont("font.vlw");
  scrollingRoad = loadImage("scrollingRoad.jpg");
  scrollingRoad.resize(500, 2000);
  road = loadImage("road.png");
  crazyRoadLogo = loadImage ("crazyRoadLogo.png");
  play = loadImage ("play.png");
  help = loadImage ("help.png");
  back = loadImage ("back.png");
  mainMenu = loadImage ("mainMenu.png");
  gameOver = loadImage ("gameOver.png");
  instructions = loadImage ("instructions.png");
  print("Stage0=MainScreen, Stage1=HelpScreen, Stage2=PlayScreen, Stage3=LoseScreen, Stage4=ResetforMainScreen"); 
  size(500, 600);
  frameRate(60);
}

// Infinite Loop

void draw() {
  /* 
   stage 0: Menu Screen
   stage 1: Help Screen
   stage 2: Play Screen
   stage 3: Lost Screen
   stage 4: Reset Screen
   */
  //main menu stage
  if (stage == 0) {
    image(road, 0, 0, 500, 600);
    image(crazyRoadLogo, 5, 25, 500, 400);
    image(help, 55, 205, 400, 400);
    image(play, 55, 275, 400, 400);
    fill(0);
    //help button
    if ((mousePressed == true) && (mouseX >=55 && mouseX <=455 && mouseY >=350 && mouseY <=505)) {//changes stage to help screen stage
      stage = 1;
    } //closing for help button
    //play button
    if ((mousePressed == true) && (mouseX >=55 && mouseX <=455 && mouseY >=450 && mouseY <=600)) {//changes stage to play screen stage
      stage = 2;
    } //closing for play button
  } // closing for stage 0
  //instructions stage
  if (stage == 1) {
    image(instructions, 0, 0, 500, 600);
    image(back, 155, -70, 200, 200);
    if ((mousePressed == true) && (mouseX > 155 && mouseX < 355 && mouseY > -70 && mouseY < 130)) {//changes stage to main menu screen stage
      stage = 0;
    }
  } //closing for stage 1
  //takes the player to the main menu, resets score, and resets obstacles y value.
  if (stage == 4) {
    x = 220;
    y = 495;
    stage = 0;
    points = 0;
    lives = 3;
    cY1 = random(-150, -20); //y coordinate of the obstacle 1
    s1 = random(4, 7); //speed of the obstacle 1
    cY2 = random(-150, -20); //y coordinate of the obstacle 2
    s2 = random(4, 7); //speed of the obstacle 2
    cY3 = random(-150, -20); //y coordinate of the obstacle 3
    s3 = random(4, 7); //speed of the obstacle 3
    cY4 = random(-150, -20); //y coordinate of the obstacle 4
    s4 = random(4, 7); //speed of the obstacle 4
    cY5 = random(-150, -20); //y coordinate of the obstacle 5
    s5 = random(4, 7); //speed of the obstacle 5
  } //closing for stage 4
  //play stage
  if (stage == 2) {
    //background
    if (by<0) {
      image(scrollingRoad, 0, by, 500, 2000);
      by=by+2; //moving background down
    } else {
      by = -980; //after 4 screens start again
    }
    //trees
    //text points and lives
    textFont(font, 24);
    fill(0);
    rect(410, 5, 85, 40);
    fill(255);
    textSize(15);
    text("Points:", 415, 20);
    text(points, 468, 20);
    text("Lives:", 415, 40);
    text(lives, 459, 40);
    //rock obstacle
    image(rock, cX1, cY1, 40, 40);
    if (dist(cX1, cY1, x-10, y+10)<r2+10) { //distance between centers less than sum of two radii
      lives=lives-1;
      cX1 = random(80, 325);
      cY1 = random(-150, -20);
    }
    cY1=cY1+s1;
    if (cY1>600) {
      points=points+1;
      cY1 = random(-150, -20); 
      cX1 = random(80, 325); 
      s1 = random(4, 7);
    }
    //pylon obstacle
    image(pylon, cX2, cY2, 50, 50);
    if (dist(cX2, cY2, x, y)<r2+10) { //distance between centers less than sum of two radii 
      lives=lives-1;
      cX2 = random(80, 325);
      cY2 = random(-150, -20);
    }
    cY2=cY2+s2;
    if (cY2>600) {
      points=points+1;
      cY2 = random(-150, -20); 
      cX2 = random(80, 325); 
      s2 = random(4, 7);
    }
    //grey car obstacle
    image(car1, cX3, cY3, 65, 100);
    if (dist(cX3, cY3, x, y-40)<r+10) { //distance between centers less than sum of two radii 
      lives=lives-1;
      cX3 = random(250, 325);
      cY3 = random(-150, -20);
    }
    cY3=cY3+s3;
    if (cY3>600) {
      points=points+1;
      cY3 = random(-150, -20); 
      cX3 = random(250, 325); 
      s3 = random(4, 7);
    }
    //blue car obstacle
    image(car2, cX4, cY4, 70, 105);
    if (dist(cX4, cY4, x, y-50)<r+10) { //distance between centers less than sum of two radii 
      lives=lives-1;
      cX4 = random(80, 180);
      cY4 = random(-150, -20);
    }
    cY4=cY4+s4;
    if (cY4>600) {
      points=points+1;
      cY4 = random(-150, -20); 
      cX4 = random(80, 180); 
      s4 = random(4, 7);
    }
    //raccoon obstacle
    image(raccoon, cX5, cY5, 55, 55);
    if (dist(cX5, cY5, x, y+10)<r3+10) { //distance between centers less than sum of two radii
      lives=lives-1;
      cX5 = random(340, 380);
      cY5 = random(-150, -20);
    }
    cY5=cY5+s5;
    if (cY5>600) {
      points=points+1;
      cY5 = random(-150, -20); 
      cX5 = random(340, 380); 
      s5 = random(4, 7);
    }
    image(car, x, y, 70, 100);
    //restrictions
    if (x<=75) {
      x=x+10;
    }
    if (x>=365) {
      x=x-10;
    }
    //game over stage
    if (lives==0) {
      stage = 3;
    }
  }//closing for stage 2
  if (stage == 3) {
    image(road, 0, 0, 500, 600);
    image(crazyRoadLogo, 5, -50, 500, 400);
    image(gameOver, -145, -45, 800, 1000);
    image(mainMenu, -45, 30, 600, 600);
    fill(0);
    if ((mousePressed == true) && (mouseX >=-45 && mouseX <=555 && mouseY >=30 && mouseY <=350)) {//changes stage to main menu screen stage
      stage = 4;
    }
  }//closing for stage 3
}//end of draw

void keyPressed() {
  //keyboard commands for movement
  if ((key == CODED) && (keyCode == RIGHT)) {
    x=x+15;
  }
  if ((key == CODED) && (keyCode == LEFT)) {      
    x=x-15;
  }
}//end of keyPressed
