

class Stroke {

	PVector strokePosition;
	
	float strokeSize;

	color strokeColor;


	Stroke(PVector pos, float s, color c){
		this.strokePosition = pos.copy();
		this.strokeSize = s;
		this.strokeColor = c;
	}

	void display(){
		stroke(strokeColor);
		point(strokePosition.x, strokePosition.y);
	}
}