class StrokeBrush extends Stroke {

	PImage imgBrush;
	float strokeWidth;
	float strokeHeight;
	
	StrokeBrush(PImage brush, PVector pos, float w, float h, color c){
		super(pos, w, c);
		this.imgBrush = brush;
		this.strokeWidth = w;
		this.strokeHeight = h;

		this.imgBrush.resize((int)w, 0);
	}

	void display(){
		imageMode(CENTER);
		
		translate(strokePosition.x, strokePosition.y);
		rotate(random(-PI/50, PI/50));
		tint(strokeColor, 200);
		image(imgBrush, 0,0);
	}
}