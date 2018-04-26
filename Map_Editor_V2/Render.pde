public void render(){
  for(int k = 0; k < 16; k++){
    for(int v = 0; v < 16; v++){
      if(renderTiles){
        if(tileMap[k][v] != 0){
          image(tiles[tileMap[k][v]-1],k*32,v*32);  
        }
      }
      if(renderSprites){
        if(spriteMap[k][v] != 0){
          image(sprites[spriteMap[k][v]-1],k*32,v*32);
        }
      }
      drawCursor(k, v);
    }
  }
  fill(100,100,100);
  rect(512, 0, 96, 512);
  for(int k = 0; k < 3; k++){
    for(int v = 0; v < 16; v++){
      if(toolbarMap[k][v] != 0){
        if(!(toolbarMap[k][v] > tiles.length)){
          image(tiles[toolbarMap[k][v]-1],k*32+512,v*32);
          if(mouseDown){
            if(mouseOver(k*32+512,v*32,32,32)){ 
              mouseSelection = toolbarMap[k][v];
            }
          }
        }else if(!(toolbarMap[k][v] > (sprites.length + tiles.length))){
          image(sprites[toolbarMap[k][v]-tiles.length-1], k*32+512, v*32);
          if(mouseDown){
            if(mouseOver(k*32+512,v*32,32,32)){ 
              mouseSelection = toolbarMap[k][v];
            }
          }
        }else if(!(toolbarMap[k][v] > (sprites.length + tiles.length + buttons.length))){
          image(buttons[toolbarMap[k][v]-tiles.length-sprites.length-1], k*32+512, v*32);
          if(mouseDown){
            if(mouseOver(k*32+512,v*32,32,32)){ 
              buttonPressed(toolbarMap[k][v] - tiles.length - sprites.length - 1, k, v);
            }
          }
        }
      }
    }  
  }
}