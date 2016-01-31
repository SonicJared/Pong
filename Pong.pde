void setup(){
background(0, 0, 0);
size(400, 400);
fill(255, 0, 0);  //coloring
stroke(255, 255, 255);
strokeWeight(3);
}

int x = 200;//ball starting position
int y = 200;
int xspeed = 0;
int yspeed = 0;
int startlives = 5;
int lives = 5;
int score = 0;
int rectlength = 100;
int minrectlength = 20;//smallest the rectangle can get
int startrectlength = 100; //how big the paddle is at the beginning


void draw(){
    int xdir = int(random(-1, 1));//ball starting dir
    int ydir = int(random(-1, 1));
    
    if(xdir<0){
        xdir = -1;
    }else{
        xdir = 1;
    }
    if(ydir<0){
        ydir = -1;
    }else{
        ydir = 1;
    }
    fill(mouseX, mouseY, x);
    textSize(10);
    background(0, 0, 0);
    
    if(xspeed==0){
        textSize(30);
        text("Press Any Key to Start",54,126);
    }
    textSize(10);
    
    if(keyPressed && xspeed == 0){
       xspeed = int(random(7,10))*xdir;//press a key to
       yspeed = int(random(8,11))*ydir;//start
}   
    ellipse(x, y, 30, 30);//ball
    
    if(x>385){          //bounce off the sides
        xspeed *= -1;
    }
    if(x<15){
        xspeed *= -1;
        
    }
    if(y>370 && x<mouseX+rectlength/2 && x >mouseX-rectlength/2){//bounce off the rectangle, and add points
        yspeed *= -1;
        score+= 2;
    }
    if(y>370 && x<mouseX+rectlength/2 && x >mouseX-rectlength/2 && keyPressed && keyCode == UP){
        score+= 5;
    }
    if(y<15){//bounce off the top
        yspeed *= -1;
        
    }if(y>400){//if the ball falls
        lives -= 1;//lose a life
        x=200;//reset ball
        y=200;
        xspeed=0;//stop ball
        yspeed=0;
    }
    
     if(rectlength>minrectlength){//shrink the rectangle
         rectlength = 100 - score;
     }
     
    x += xspeed;//move the ball
    y += yspeed;
    rect(mouseX-rectlength/2 , 380, rectlength, 20);//move the rectangle
    text("Lives:" + lives,0,10);//ingame text
    text("Score:" + score,319,10);
    
    if(lives<1){//Game over Menu
        xspeed=0;
        yspeed=0;
        fill(255, 0, 0);
        rect(0,0,400,400);
        fill(3, 0, 0);
        textSize(50);
        text("GAME OVER",60, 200);
        textSize(30);
        text("Score:" + score, 154, 243);
        noStroke();
        rect(36,257,334,50);
        stroke(255, 255, 255);
        fill(255, 0, 0);
        text("Click Here to Restart",66,293);
        
        
        //button to restart
    }if(lives<1&& mousePressed && mouseX >36&&mouseX<370&&mouseY>257&&mouseY<307){
        lives = startlives;
        score = 0;
        rectlength = startrectlength;
    }
};