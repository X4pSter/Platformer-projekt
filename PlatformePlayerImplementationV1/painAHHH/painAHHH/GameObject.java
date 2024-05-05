import processing.core.*;

public class GameObject extends Animation{
    
    private PApplet p;

    public  PVector position        = new PVector(0, 0);
    private PVector velocity        = new PVector(0, 0);
    private PVector acceleration    = new PVector(0, 0);

    public  boolean moveUp, moveLeft, moveRight;
    public  boolean onGround;
    public  int     groundPositionY;
    public  int     width, height;
    private float   speed;

    public GameObject(PApplet p, String filename, int x, int y, float s, int w, int h){
        this.p          = p;
        groundPositionY = y;
        speed           = s;
        width           = w;
        height          = h;
        position.set(x,y);
        super(p,filename);
    }   

    private void updatePhysics(){
        //Tyngdekraften
        if(onGround){ velocity.y = 0; position.y = groundPositionY; acceleration.y = 0; velocity.x*=speed;}
        if(!onGround){ acceleration.y = 0.5f;}        

        //Bruger input til at ændre accelerationen
        if(onGround && moveLeft){   acceleration.x = -0.5f; }
        if(onGround && moveRight){  acceleration.x = 0.5f;}
        if(onGround && moveUp){     acceleration.y = -10f;}

        //Fysikken opdateres
        velocity.add(acceleration);
        position.add(velocity);
        acceleration.mult(0);
    }

    public void displayAndUpdatePhysics(){
        display();
        updatePhysics();
    }

    public boolean handlePlatformCollision(int x, int y, int w, int h){
        boolean isCollided = position.x+width/2 > x && position.x+width/2 < x+w && position.y > y && position.y < y+h || position.x-width/2 > x && position.x-width/2 < x+w && position.y > y && position.y < y+h;
        if(isCollided){this.groundPositionY = y + 1;}
        this.onGround = isCollided;
        boolean isCollidedTop = position.x+width/2 > x && position.x+width/2 < x+w && position.y > y+height && position.y < y+h+height || position.x-width/2 > x && position.x-width/2 < x+w && position.y > y+height && position.y < y+h+height;
        if(isCollidedTop){velocity.y = -acceleration.y;}
        return isCollided;
    }

    public boolean handleObjectCollision(float x, float y, int w, int h){
        boolean isCollided = position.x >= x && position.x <= x + w && position.y >= y && position.y <= y + h || position.x >= x - 50 && position.x <= x + w - 50 && position.y >= y && position.y <= y + h;
        return isCollided;
    }
    
    private void display(position.x,position.y){
        //tegning af spilleren
        p.fill(255);
        p.textSize(20);
        
    }
}
