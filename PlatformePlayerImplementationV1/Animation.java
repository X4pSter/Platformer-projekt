import processing.core.*;

public class Animation{

    private PApplet p;

    private PImage spritesheet;

    private int wFrame;            //bredde på hver enkelt frame i spritesheet  
    private int hFrame;            //højde på hver enkelt frame i spritesheet  
    private int row, column;       //row og column bruges til at vælge hvilken "nummer" frame
    private int xFrame=0,yFrame=0; //xFrame og yFrame anvendes til at finde øverste venstre hjørne af denne frame 

    private int reverseFactor = 1; //reverseFactor bruges til at spejlvende en frame

    public Animation(PApplet p, String filename){
        p.imageMode(p.CENTER);
        spritesheet = p.loadImage(filename);
        wFrame = spritesheet.width/4;
        hFrame = spritesheet.height;
        this.p = p;
    }


    public void display(int posX, int posY){
        if(p.frameCount%10==0){ //animationen er lidt hurtig, så jeg ændrer kun frame hver 5. billede
    
            //udvælgelse af næste frame
            if (column<4)   { column++; }    
            if (column==4)  { column=0; }
            //Tallet 25 er korigering fordi tegningerne på mit spritsheet er for langt til venstre!
            xFrame = (column)*wFrame;  
        }

        PImage sprite = spritesheet.get(xFrame, yFrame, wFrame, hFrame);

        p.pushMatrix();
        p.scale(reverseFactor, 1);
        //billedet var alt for stort så det er sat til 100X100 pixels istedet
        p.image(sprite, reverseFactor*posX, posY,50,50);    
        p.popMatrix();
    }

    public void reverseImage(){
        reverseFactor = -reverseFactor;
    }

}