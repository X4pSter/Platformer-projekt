Player      player;

GameObject  goal;

Animation   animation;

Button      youLostButton;
Button      restartButton;

ArrayList<Platform> platforme;
ArrayList<Fjende>   fjender;

// data for tre forskellige platforme
int groundX = 200, groundY = 700, groundW = 1000, groundH = 100;  
int groundX2 = 200, groundY2 = 600, groundW2 = 325;
int groundX3 = 850, groundY3 = 550, groundW3 = 300;
int groundX4 = 700, groundY4 = 450, groundW4 = 75;
int groundX5 = 200, groundY5 = 350, groundW5 = 350;
int groundX6 = 75, groundY6 = 300, groundW6 = 75;
int groundX7 = 250, groundY7 = 200, groundW7 = 150;
int groundX8 = 550, groundY8 = 75, groundW8 = 75;
int groundX9 = 750, groundY9 = 125, groundW9 = 75;
int groundX10 = 950, groundY10 = 300, groundW10 = 450, groundH2 = 25;
int platformH = 10;

int objectW = 50, objectH = 50;

int timeSpent;

boolean lost;
boolean won;

void setup(){
    lost = false;
    won  = false;

    size(1400,800);
    background(100);
    frameRate(60);
    frameCount = 0;

    player = new Player(this,"Mario.png",400,groundY,0.95,objectW,objectH,3);

    goal = new GameObject(this,"flag.png",1200,groundY10,0,objectW,objectH,1);

    youLostButton = new Button(width/2 - 50,350,100,50,"Restart","setup");
    restartButton = new Button(width-101,0,100,50,"Restart","setup");

    fjender   = new ArrayList<Fjende>();
    platforme = new ArrayList<Platform>();

    fjender.add(new Fjende(this,"Swamp.png",225,groundY2,0.6,objectW,objectH,375,4));
    fjender.add(new Fjende(this,"Swamp.png",900,groundY3,0.6,objectW,objectH,250,4));
    fjender.add(new Fjende(this,"Swamp.png",225,groundY5,0.6,objectW,objectH,450,4));

    platforme.add(new Platform(this,groundX,groundY,groundW,groundH));
    platforme.add(new Platform(this,groundX2,groundY2,groundW2,platformH));
    platforme.add(new Platform(this,groundX3,groundY3,groundW3,platformH));
    platforme.add(new Platform(this,groundX4,groundY4,groundW4,platformH));
    platforme.add(new Platform(this,groundX5,groundY5,groundW5,platformH));
    platforme.add(new Platform(this,groundX6,groundY6,groundW6,platformH));
    platforme.add(new Platform(this,groundX7,groundY7,groundW7,platformH));
    platforme.add(new Platform(this,groundX8,groundY8,groundW8,platformH));
    platforme.add(new Platform(this,groundX9,groundY9,groundW9,platformH));
    platforme.add(new Platform(this,groundX10,groundY10,groundW10,groundH2));
}

void draw() {    
    background(100);
    fill(255);
    if(!lost){
        for(int i = 0; i < platforme.size(); i++){
            Platform platformTemp = platforme.get(i);
            platformTemp.platformDisplay();
        }

        for(int i = 0; i < fjender.size(); i++){
            Fjende fjendeTemp = fjender.get(i);
            fjendeTemp.displayAndUpdatePhysics();
            fjendeTemp.movement();
        }

        for(int i = 0; i < platforme.size(); i++){
            Platform platformTemp = platforme.get(i);
            if(player.handlePlatformCollision(platformTemp.groundX,platformTemp.groundY,platformTemp.groundW,platformTemp.groundH)) break;
        }
        
        for(int i = 0; i < platforme.size(); i++){
            Platform platformTemp = platforme.get(i);
            if(goal.handlePlatformCollision(platformTemp.groundX,platformTemp.groundY,platformTemp.groundW,platformTemp.groundH)) break;
        }
        
        for(int i = 0; i < fjender.size(); i++){
            Fjende   fjendeTemp   = fjender.get(i);
            for(int j = 0; j < platforme.size(); j++){
                Platform platformTemp = platforme.get(j);
                if(fjendeTemp.handlePlatformCollision(platformTemp.groundX,platformTemp.groundY,platformTemp.groundW,platformTemp.groundH)) break;
            }
        }
        
        for(int i = 0; i < fjender.size(); i++){
            Fjende fjendeTemp = fjender.get(i);
            PVector temp = fjendeTemp.position;
            if(player.handleObjectCollision(temp.x,temp.y,fjendeTemp.width,fjendeTemp.height)){ lost = true; break;}
        }

        PVector temp = goal.position;

        if(player.handleObjectCollision(temp.x,temp.y,objectW,objectH)){ won = true; lost = true; timeSpent = frameCount/60;}

        player.displayAndUpdatePhysics();
        player.playerDisplay();

        goal.displayAndUpdatePhysics();

        temp = player.position;

        if(temp.y > 900){lost = true;}

        if(temp.x + objectW/2 >= width){temp.x = width - objectW/2;}
        if(temp.x - objectW/2 <= 0){temp.x = 0 + objectW/2;}

        restartButton.display();
    }

    if(lost){
        textSize(100);
        if(lost && !won){
            String lose = "You lose!";
            float textWidth = textWidth(lose);
            text(lose,width / 2 - textWidth / 2,200);
        }

        if(lost && won){
            String win = "You win!";
            float textWidth = textWidth(win);
            text(win,width / 2 - textWidth / 2,200);
            textSize(25);
            String timeSpentText = "You won in " + timeSpent + " seconds";
            textWidth = textWidth(timeSpentText);
            text(timeSpentText,width / 2 - textWidth / 2, 280);
        }
        
        youLostButton.display();
    }
}

void keyPressed(){
    player.keyPressed();
}

void keyReleased() {
    player.keyReleased();
}

void mousePressed(){
    youLostButton.mouseClickDetection();
    restartButton.mouseClickDetection();
}