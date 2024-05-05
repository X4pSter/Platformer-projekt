class Button{
  float x,y,b,h; 
  String titel;        
  String action;
 
Button(float xin,float yin, float bin, float hin, String titelin, String actionin){
  x = xin; 
  y = yin; 
  b = bin; 
  h = hin;
  titel = titelin; 
  action = actionin;
}

 void display(){
    fill(255);    
    rect(x,y,b,h);
    fill(0);
    textSize(15);
    float w = textWidth(titel);
    text(titel,x + b/2 - w/2,y + h/2 + 5);
    stroke(0);
 }

 void mouseClickDetection(){
   if(mouseX < x + b && mouseX > x && mouseY < y + h && mouseY > y){
     method(action); 
   }
 }

}
