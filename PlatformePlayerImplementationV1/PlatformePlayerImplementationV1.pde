Player player;
Fjende fjende;
Animation animation;

ArrayList<Platform> platforme = new ArrayList<Platform>();

// data for tre forskellige platforme
int groundX = 200, groundY = 400, groundW = 1000, groundH = 100;  
int groundX2 = 200, groundY2 = 300, groundW2 = 300, groundH2 = 10;
int groundX3 = 800, groundY3 = 250, groundW3 = 300, groundH3 = 10;
int playerW = 50, playerH = 50;
int fjendeW = 50, fjendeH = 50;

void setup() {
    size(1400,500);
    background(50);
    player = new Player(this,400,groundY,0.95,playerW,playerH);
    fjende = new Fjende(this,850,groundY3,0.625,fjendeW,fjendeH,300);
    platforme.add(new Platform(this,groundX,groundY,groundW,groundH));
    platforme.add(new Platform(this,groundX2,groundY2,groundW2,groundH2));
    platforme.add(new Platform(this,groundX3,groundY3,groundW3,groundH3));
    animation = new Animation(this,"Swamp.png");
}

void draw() {    
    background(100);

    for(int i = 0; i < platforme.size(); i++){
        Platform platformTemp = platforme.get(i);
        platformTemp.platformDisplay();
    }

    for(int i = 0; i < platforme.size(); i++){
        Platform platformTemp = platforme.get(i);
        if(player.handlePlatformCollision(platformTemp.groundX,platformTemp.groundY,platformTemp.groundW,platformTemp.groundH)) break;
    }

    for(int i = 0; i < platforme.size(); i++){
        Platform platformTemp = platforme.get(i);
        if(fjende.handlePlatformCollision(platformTemp.groundX,platformTemp.groundY,platformTemp.groundW,platformTemp.groundH)) break;
    }

    PVector temp = fjende.position;

    text(str(player.handleObjectCollision(temp.x,temp.y,fjendeW,fjendeH)),800,150);

    player.displayAndUpdatePhysics();
    player.playerDisplay();
    fjende.displayAndUpdatePhysics();
    fjende.movement();
    
    //animation.display(mouseX,mouseY);
}

void keyPressed() {
    player.keyPressed();
}

void keyReleased() {
    player.keyReleased();
}

void mousePressed(){
    animation.reverseImage();
}