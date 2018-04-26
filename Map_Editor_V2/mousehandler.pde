public void mouseReleased(){
  mouseDown = true;
}
public boolean mouseOver(int x1, int y1, int xl, int yl){
  if(mouseX < (x1+xl) && mouseX > x1 && mouseY < (y1+yl) && mouseY > y1){
    return true;
  }else{
    return false;
  }
}
void drawCursor(int k, int v){
  if(mouseOver(k*32, v*32, 32, 32)){
    image(cursor, k*32, v*32);
      if(mousePressed){   
        if(mouseSelection != 0){
          if(!(mouseSelection > tiles.length)){
            tileMap[k][v] = mouseSelection;  
          }else{
            spriteMap[k][v] = mouseSelection - tiles.length;
          }
        }else{
          if(renderTiles){
            tileMap[k][v] = 0;
          }
          if(renderSprites){
            spriteMap[k][v] = 0;
          }
        }
     }
  } 
}
public void buttonPressed(int button, int k, int v){
  switch(button){
    case 0:
      mouseSelection = 0;
    break;
    case 1:
      renderSprites = false;
      toolbarMap[k][v] = 2 + tiles.length + sprites.length + 1;
    break;
    case 2:
      renderSprites = true;
      toolbarMap[k][v] = 1 + tiles.length + sprites.length + 1;
    break;
    case 3:
      renderTiles = false;
      toolbarMap[k][v] = 4 + tiles.length + sprites.length + 1;
    break;
    case 4:
      renderTiles = true;
      toolbarMap[k][v] = 3 + tiles.length + sprites.length + 1;
    break;
    case 5:
    
    break;
    case 6:
    
    break;
    case 7:
      if(renderTiles){
        tileMap = new int[][] {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
      }
      if(renderSprites){
        spriteMap = new int[][] {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
      }
    break;
  }
}