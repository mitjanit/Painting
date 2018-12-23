

class StrokeRect extends Stroke {

	float strokeWidth;
	float strokeHeight;
	
	StrokeRect(PVector pos, float w, float h, color c){
		super(pos, w, c);
		this.strokeWidth = w;
		this.strokeHeight = h;
	}

	void display(){
		rectMode(CENTER);
		fill(strokeColor); noStroke();
		rect(strokePosition.x, strokePosition.y, strokeWidth, strokeHeight);
	}
}