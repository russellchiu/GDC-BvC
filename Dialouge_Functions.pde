public void openDialouge(int ID){
  
}
public void drawDialouge(){
  fill(255,255,255);
 rect(0,300,500,200); //Dialogue box
 fill(0);
 textSize(16);
 text("Next>>",400,450); //Indicates clicking
 int sub=((dialogue.get(text).length())/60) + 1;
 int textRow=360;
 for(int i=0; i<sub; i++)
 {
   if(i==sub-1)
   {
    text(dialogue.get(text).substring(i*60), 10, textRow); 
   }
   else
  text(dialogue.get(text).substring(i*60, i*60 +60),10,textRow);
  textRow=textRow+20;
 }
 //text(Dialogue, 10,360); //Dialogue
 textSize(26);
 text(character, 10,340); //Character Name
 /*ArrayList<Character> nameList = new ArrayList<Character>();
for(int i=0; i<character.length(); i++)
{
  nameList.add(character.charAt(i));
}
int position=10;
for(int i=0; i<nameList.size(); i++)
{
  text(nameList.get(i), position, 340);
  position=position+20;
}
textSize(12);

int textPosition = 10;
int textRow = 360;
ArrayList<Character> dialogueList = new ArrayList<Character>();
   for(int d=0; d<dialogue.get(text).length(); d++)
   {
     dialogueList.add(dialogue.get(text).charAt(d));
   }
 
 for(int i=0; i<dialogueList.size(); i++)
 {
  text(dialogueList.get(i), textPosition, textRow);
  textPosition=textPosition + 10;
  if(textPosition>450)
  {
    textRow=textRow+20;
    textPosition=10;
  }
 }*/
}
