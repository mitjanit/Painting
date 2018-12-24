
int    sceneWidth   = 1200;
int    sceneHeight  = 800;
color  bgColor    = #ECECEC;
String pathDATA = "../../../data/";

String imgName = "landscape01.jpg";
PImage img;
PImage brush;
int strokesFrame = 100;
color colorGradient1, colorGradient2;

void settings() {
	size(sceneWidth,sceneHeight,P2D);

}


void setup(){
	background(bgColor);
	frameRate(1000);
	img = loadImage(pathDATA+imgName);
	brush = loadImage(pathDATA+"/brushes/stroke1.png");
	//image(img, 0, 0);
	colorGradient1 = color(255,0,0);
	colorGradient2 = color(255, 255, 255);
}

void draw(){

	for(int i=0; i<strokesFrame; i++){
		
		PVector pos = getRandomPos(img);
		color inColor = getColorAt(img, pos.x, pos.y);
		PVector target = mapPosition(pos, img, width, height);
		float b = brightness(inColor);
		color gradientColor = lerpColor(colorGradient1, colorGradient2, b/255);
		color outColor = lerpColor(inColor, gradientColor, 0.0);
		float strokeSize = 80 - frameCount/10.0;
		if(strokeSize<20){ strokeSize = 20; }
		//Stroke s = new Stroke(target, 1, c);
		StrokeRect sr = new StrokeRect(target, strokeSize, strokeSize, outColor);
		//StrokeEllipse se = new StrokeEllipse(target, 10, 10, c);
		StrokeBrush sb = new StrokeBrush(brush,target, (int)strokeSize, 40, outColor);
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