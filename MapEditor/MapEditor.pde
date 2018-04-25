PImage tile1;
PImage tile2;
PImage tile3;
PImage tile4;
PImage cursor;
PImage sprite1;
PImage sprite2;
PImage sprite3;
PImage colliderButtonOn;
PImage colliderButtonOff;
PImage mapButtonOn;
PImage mapButtonOff;
PImage saveButton;
PImage clearAllButton;
boolean renderTiles = true;
boolean renderSprites = true;
int counter;
int selection = 0;
int mapLayer = 0;
int[][] tileMap = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
int[][] colliderMap = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
JSONObject save;
JSONArray saveHandler;
void setup(){
  try{
    System.out.println("Found save file... loading..."); 
    load();  
  }catch(Exception e){
    System.out.println("Error: " + e + " Check if file Saves/save.json exists.");  
  }
  frameRate(60);
  size(512,576);
  tile1 = loadImage("Textures/Tiles/Tile1.png");
  tile2 = loadImage("Textures/Tiles/Tile2.png");
  tile3 = loadImage("Textures/Tiles/Tile3.png");
  tile4 = loadImage("Textures/Tiles/Tile4.png");
  cursor = loadImage("Textures/Cursors/Cursor.png");
  sprite1 = loadImage("Textures/Sprites/Sprite1Front1.png");
  sprite2 = loadImage("Textures/Sprites/Sprite2Front1.png");
  sprite3 = loadImage("Textures/Sprites/Sprite3Front1.png");
  colliderButtonOn = loadImage("Textures/Buttons/ColliderButtonOn.png");
  colliderButtonOff = loadImage("Textures/Buttons/ColliderButtonOff.png");
  mapButtonOn = loadImage("Textures/Buttons/MapButtonOn.png");
  mapButtonOff = loadImage("Textures/Buttons/MapButtonOff.png");
  saveButton = loadImage("Textures/Buttons/SaveButton.png");
  clearAllButton = loadImage("Textures/Buttons/ClearAllButton.png");
}
void draw(){
  background(0,0,0);
  fill(150,150,150);
  rect(0,512,512,64);
  image(cursor, 0, 512);
  image(tile1, 32, 512);
  image(tile2, 64, 512);
  image(tile3, 96, 512);
  image(tile4, 128, 512);
  image(cursor, 0, 546);
  image(sprite1, 32, 546);
  image(sprite2, 64, 546);
  image(sprite3, 96, 546);
  image(saveButton, 448, 514);
  image(clearAllButton, 448, 546);
  if(renderTiles){
    image(mapButtonOn, 480, 514);
  }else{
    image(mapButtonOff, 480, 514);
  }
  if(renderSprites){
    image(colliderButtonOn, 480, 546);
  }else{
    image(colliderButtonOff, 480, 546);
  }
  for(int xr = 0; xr < 16; xr++){
    for(int yr = 0; yr < 16; yr++){
      if(renderTiles){
        renderTile(xr, yr);
      }
      if(renderSprites){
        renderSprite(xr,yr);
      }
      if(mouseOver(xr*32, yr*32, 32, 32)){
        image(cursor, xr*32, yr*32);
        if(mousePressed){
          if(mapLayer == 0){
            tileMap[xr][yr] = selection;
          }else{
            colliderMap[xr][yr] = selection;  
          }
        }
      }
    }
  }
}
public void renderTile(int xr, int yr){
  switch(tileMap[xr][yr]){
    case 1:
      image(tile1, xr*32, yr*32);
    break;
    case 2:
      image(tile2, xr*32, yr*32);
    break;
    case 3:
      image(tile3, xr*32, yr*32);
    break;
    case 4:
      image(tile4, xr*32, yr*32);
    break;
  }
}
public void renderSprite(int xr, int yr){
  switch(colliderMap[xr][yr]){
    case 1:
      image(sprite1, xr*32, yr*32);
    break;
    case 2:
      image(sprite2, xr*32, yr*32);
    break;
    case 3:
      image(sprite3, xr*32, yr*32);
    break;
  }
}
void mouseClicked(){
  checkPress();
}
public void load(){
  counter = 0;
  JSONObject load = loadJSONObject("Saves/save.json");
  saveHandler = load.getJSONArray("map");
  for(int xl = 0; xl < 16; xl++){
    for(int yl = 0; yl < 16; yl++){
      tileMap[xl][yl] = saveHandler.getJSONObject(counter).getInt("tile");
      colliderMap[xl][yl] = saveHandler.getJSONObject(counter).getInt("collider");
      counter++;
    }
  }
}
public void save(){
  saveHandler = new JSONArray();
  save = new JSONObject();
  counter = 0;
  for(int xl = 0; xl < 16; xl++){
    for(int yl = 0; yl < 16; yl++){
      JSONObject tile = new JSONObject();
      tile.setInt("tile", tileMap[xl][yl]);
      tile.setInt("collider", colliderMap[xl][yl]);
      saveHandler.setJSONObject(counter, tile);
      counter++;
    }
  }
  save.setJSONArray("map", saveHandler);
  saveJSONObject(save, "Saves/save.json");
}
public boolean mouseOver(int x1, int y1, int xl, int yl){
  if(mouseX < (x1+xl) && mouseX > x1 && mouseY < (y1+yl) && mouseY > y1){
    return true;
  }else{
    return false;
  }
}
public void checkPress(){
  if(mouseOver(0,512,32,32)){
    selection = 0;
    mapLayer = 0;
  }
  if(mouseOver(0,546,32,32)){
    selection = 0;
    mapLayer = 1;
  }
  if(mouseOver(32,512,32,32)){
    selection = 1;
    mapLayer = 0;
  }
  if(mouseOver(32,546,32,32)){
    selection = 1;
    mapLayer = 1;
  }if(mouseOver(64,512,32,32)){
    selection = 2;
    mapLayer = 0;
  }
  if(mouseOver(64,546,32,32)){
    selection = 2;
    mapLayer = 1;
  }
  if(mouseOver(96,512,32,32)){
    selection = 3;
    mapLayer = 0;
  }
  if(mouseOver(96,546,32,32)){
    selection = 3;
    mapLayer = 1;
  }
  if(mouseOver(128,512,32,32)){
    selection = 4;
    mapLayer = 0;
  }
  if(mouseOver(448,546,32,32)){
    tileMap = new int[][] {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
    colliderMap = new int[][] {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
  }
  if(mouseOver(448, 514, 32, 32)){
    try{
      print("Found save file... Saving...");
      save();
    }catch(Exception e){
      print("Error saving: " + e);  
    }
  }
  if(mouseOver(480,512,32,32)){
    if(renderTiles){
      renderTiles = false; 
    }else{
      renderTiles = true; 
    }
  }
  if(mouseOver(480,546,32,32)){
    if(renderSprites){
      renderSprites = false; 
    }else{
      renderSprites = true; 
    }
  }  
}