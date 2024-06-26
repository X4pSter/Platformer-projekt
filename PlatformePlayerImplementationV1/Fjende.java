import processing.core.*;

public class Fjende extends GameObject{

    private PApplet p;

    private int c = -5;

    private int time;

    public Fjende(PApplet p, String fileName, int x, int y, float s, int w, int h, int t, int a){
        super(p,fileName,x,y,s,w,h,a);
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
