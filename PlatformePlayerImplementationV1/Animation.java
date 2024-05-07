import processing.core.*;

public class Animation{

    private PApplet p;

    private PImage spritesheet;

    private int wFrame;            //bredde på hver enkelt frame i spritesheet1  
    private int hFrame;            //højde på hver enkelt frame i spritesheet1  
    private int row, column;       //row og column bruges til at vælge hvilken "nummer" frame
    private int xFrame=0,yFrame=0; //xFrame og yFrame anvendes til at finde øverste venstre hjørne af denne frame 

    private int amountFrames;

    public int reverseFactor = 1; //reverseFactor bruges til at spejlvende en frame

    public Animation(PApplet p, String fileName, int a){
        p.imageMode(p.CENTER);
        spritesheet = p.loadImage(fileName);
        wFrame = spritesheet.width/a;
        hFrame = spritesheet.height;
        this.p = p;
        amountFrames = a;
    }


    public void display2(float posX, float posY){
        
        if(p.frameCount%10==0){ //animationen er lidt hurtig, så jeg ændrer kun frame hver 5. billede
    
            //udvælgelse af næste frame
            if (column<amountFrames)   { column++; }    
            if (column==amountFrames)  { column=0; }
            //Tallet 25 er korigering fordi tegningerne på mit spritsheet er for langt til venstre!
            xFrame = (column)*wFrame;  
        }

        PImage sprite = spritesheet.get(xFrame, yFrame, wFrame, hFrame);

        p.pushMatrix();
        p.scale(reverseFactor, 1);
        //billedet var alt for stort så det er sat til 100X100 pixels istedet
        p.image(sprite, reverseFactor*posX, posY - 25,50,50);    
        p.popMatrix();
    }

    public void reverseImage(){
        reverseFactor = -reverseFactor;
    }

}