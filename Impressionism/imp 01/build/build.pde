
int    sceneWidth   = 1200;
int    sceneHeight  = 800;
color  bgColor    = #ECECEC;
String pathDATA = "../../../data/";

String imgName = "landscape01.jpg";
PImage img;
PImage brush;
int strokesFrame = 100;

void settings() {
	size(sceneWidth,sceneHeight,P2D);
}


void setup(){
	background(bgColor);

	img = loadImage(pathDATA+imgName);
	brush = loadImage(pathDATA+"brush01.png");
	//image(img, 0, 0);
}

void draw(){

	for(int i=0; i<strokesFrame; i++){
		
		PVector pos = getRandomPos(img);
		color c = getColorAt(img, pos.x, pos.y);
		PVector target = mapPosition(pos, img, width, height);

		//Stroke s = new Stroke(target, 1, c);
		//StrokeRect sr = new StrokeRect(target, 10, 10, c);
		//StrokeEllipse se = new StrokeEllipse(target, 10, 10, c);
		StrokeBrush sb = new StrokeBrush(brush,target, 150, 50, c);
		sb.display();
	}
	
}

void keyPressed(){
	if(key=='p' || key=='P'){
		saveFrame("frame/impressionim01-######.png");
	}
}


color getColorAt(PImage img, float x, float y){
	int pos = (int)x + (int)y*img.width;
	return img.pixels[pos];
}

PVector getRandomPos(PImage img){
	float x = random(0, img.width);
	float y = random(0, img.height);
	return new PVector(x, y);
}

PVector mapPosition(PVector orig, PImage img, float w, float h){
	float xTarget = map(orig.x, 0, img.width, 0, w);
	float yTarget = map(orig.y, 0, img.height, 0, h);
	return new PVector(xTarget, yTarget);
}