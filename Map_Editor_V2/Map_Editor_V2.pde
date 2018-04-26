PImage[] tiles;
PImage[] sprites;
PImage[] buttons;
PImage cursor;
int[][] tileMap = {{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
int[][] spriteMap = {{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
int[][] toolbarMap;
boolean renderTiles = true;
boolean renderSprites = true;
boolean mouseDown = false;
int mouseSelection = 0;
public void setup(){
  tiles = new PImage[] {loadImage("Textures/Tiles/Tile1.png"), loadImage("Textures/Tiles/Tile2.png"), loadImage("Textures/Tiles/Tile3.png"), loadImage("Textures/Tiles/Tile4.png")};
  sprites = new PImage[] {loadImage("Textures/Sprites/Sprite1Front1.png"), loadImage("Textures/Sprites/Sprite2Front1.png"), loadImage("Textures/Sprites/Sprite3Front1.png")};
  buttons = new PImage[] {loadImage("Textures/Buttons/Button1.png"), loadImage("Textures/Buttons/Button2.png"), loadImage("Textures/Buttons/Button3.png"), loadImage("Textures/Buttons/Button4.png"), loadImage("Textures/Buttons/Button5.png"), loadImage("Textures/Buttons/Button6.png"), loadImage("Textures/Buttons/Button7.png"), loadImage("Textures/Buttons/Button8.png")};
  toolbarMap = new int[][] {{1,2,3,4,0,0,0,0,0,0,0,0,0,0,0,0},{1+tiles.length,2+tiles.length,3+tiles.length,0,0,0,0,0,0,0,0,0,0,0,0,0},{1+tiles.length+sprites.length,2+tiles.length+sprites.length,4+tiles.length+sprites.length,6+tiles.length+sprites.length,7+tiles.length+sprites.length,0,0,0,0,0,0,0,0,0,0,8+tiles.length+sprites.length}};
  cursor = loadImage("Textures/Cursors/Cursor.png");
  noStroke();
  size(608, 512);
  frameRate(60);
}
public void draw(){
  background(0,0,0);
  render();
  if(!mousePressed){
    mouseDown = false;  
  }
}