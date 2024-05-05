import processing.core.*;

public class Player extends GameObject{

    private PApplet p;

    public Player(PApplet p, int x, int y, float s, int w, int h){
        super(p,x,y,s,w,h);
        this.p = p;
    }   

    public void keyPressed(){
        //Bruger starter input
        if(p.key == 'a'){   moveLeft = true; }
        if(p.key == 'd'){   moveRight = true;}
        if(p.key == 'w'){   moveUp = true;}
    }

    public void keyReleased(){
        //Bruger stopper input
        if(p.key == 'a'){   moveLeft = false;}
        if(p.key == 'd'){   moveRight = false;}
        if(p.key == 'w'){   moveUp = false;}
    }

    public void playerDisplay(){
        //dette er bare info-tekst
        p.text(" UP: " + moveUp + "\n LEFT: " + moveLeft + "\n RIGHT: " + moveRight + "\n onGround: " + onGround, 10, 20);
        p.text("POSITION : " + (int)position.x + " : " + (int)position.y, 300, 20);
        p.text("GROUND POSITION : " + groundPositionY, 300, 40);
    }

}