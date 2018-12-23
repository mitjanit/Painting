class StrokeEllipse extends Stroke {

	float strokeWidth;
	float strokeHeight;
	
	StrokeEllipse(PVector pos, float w, float h, color c){
		super(pos, w, c);
		this.strokeWidth = w;
		this.strokeHeight = h;
	}

	void display(){
		ellipseMode(CENTER);
		fill(strokeColor); noStroke();
		ellipse(strokePosition.x, strokePosition.y, strokeWidth, strokeHeight);
	}
}