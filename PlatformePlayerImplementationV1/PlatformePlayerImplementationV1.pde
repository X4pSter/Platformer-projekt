Player      player;
Animation   animation;
Button      youLostButton;

ArrayList<Platform> platforme;
ArrayList<Fjende>   fjender;

// data for tre forskellige platforme
int groundX = 200, groundY = 700, groundW = 1000, groundH = 100;  
int groundX2 = 200, groundY2 = 600, groundW2 = 325, groundH2 = 10;
int groundX3 = 850, groundY3 = 550, groundW3 = 300, groundH3 = 10;
int groundX4 = 700, groundY4 = 450, groundW4 = 75, groundH4 = 10;
int playerW = 50, playerH = 50;
int fjendeW = 50, fjendeH = 50;

boolean lost;

void setup() {
    lost = false;
    size(1400,800);
    background(100);
    player = new Player(this,400,groundY,0.95,playerW,playerH);

    youLostButton = new Button(width/2 - 50,300,100,50,"Restart","setup");

    fjender   = new ArrayList<Fjende>();
    platforme = new ArrayList<Platform>();

    fjender.add(new Fjende(this,900,groundY3,0.6,fjendeW,fjendeH,250));
    fjender.add(new Fjende(this,225,groundY2,0.6,fjendeW,fjendeH,375));

    platforme.add(new Platform(this,groundX,groundY,groundW,groundH));
    platforme.add(new Platform(this,groundX2,groundY2,groundW2,groundH2));
    platforme.add(new Platform(this,groundX3,groundY3,groundW3,groundH3));
    platforme.add(new Platform(this,groundX4,groundY4,groundW4,groundH4));

    animation = new Animation(this,"Swamp.png");
}

void draw() {    
    background(100);
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

        player.displayAndUpdatePhysics();
        player.playerDisplay();

        PVector temp = player.position;
        if(temp.y > 900){lost = true;}
    }

    if(lost){
        textSize(100);
        float textWidth = textWidth("You lost!");
        text("You lost",width / 2 - textWidth / 2,200);
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
    animation.reverseImage();
    youLostButton.mouseClickDetection();
}