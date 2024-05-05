import processing.core.*;

public class Platform{

    private PApplet p;

    public int groundX;
    public int groundY;
    public int groundW;
    public int groundH;

    public Platform(PApplet pp,int x,int y,int w,int h){
        p = pp;
        groundX = x;
        groundY = y;
        groundW = w;
        groundH = h;
    }

    public void platformDisplay(){
        display();
    }

    private void display(){
        p.rect(groundX,groundY,groundW,groundH);
    }
}
