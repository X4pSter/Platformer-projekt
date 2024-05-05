import processing.core.*;

public class Fjende extends GameObject{

    private PApplet p;

    private int c = -5;

    private int time;

    public Fjende(PApplet p, String filename, int x, int y, float s, int w, int h, int t){
        super(p,filename,x,y,s,w,h);
        this.p = p;
        time = t;
    }

    public void movement(){
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
