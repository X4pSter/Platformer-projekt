import processing.core.*;

public class Fjende extends GameObject{

    private PApplet p;

    private int c = -5;

    public Fjende(PApplet p, int x, int y, float s, int w, int h){
        super(p,x,y,s,w,h);
        this.p = p;
    }

    public void movement(){
        int time = 220;
        c = (c + 1) % time;
        if(c < time/2){
            moveRight = true;
            moveLeft = false;
        } else{
            moveRight = false;
            moveLeft = true;
        }
    }
}