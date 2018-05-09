int value=0;
int text=0;
int chara = 0;
String Dialogue="";
boolean textOn=false;
String character="";
boolean DialogueOn=false;
ArrayList<String> dialogue = new ArrayList<String>();
void setup(){
  size(500,500);
  dialogue.add("Test Test Test Test Test Test Test Test");
  dialogue.add("According to all known laws of aviation, a bee shouldn't be able to fly.");
  dialogue.add("It's tiny little wings shouldn't be able to lift it's fat body off the ground.");
  dialogue.add("The bee however, flies, because it doesn't care what humans think should and shouldn't be possible.");
  character="Test Man";
  DialogueOn=true;
}


void draw(){
  background(0,0,0);
 if(textOn&&DialogueOn){
   drawDialouge();
  
 }
 
}
/* void draw(){
  fill(value);
 rect(0,300,499,199); //Dialogue box
 fill(0);
 text("Next>>",400,450); //Indicates clicking
 text(dialogue.get(text), 10,350); //Dialogue
}*/
 void mouseClicked() {
   if(!textOn&&text<dialogue.size())
   {
    textOn=true;
    Dialogue=dialogue.get(text);
   }
   
   else if(text==dialogue.size()-1)
   {
     DialogueOn=false; 
   }
  
   else{
    textOn=false;
    if(text<dialogue.size()-1) {
      text++;
      
      
    }  
 }
 }
