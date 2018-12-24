class StrokeBrush extends Stroke {

	PImage imgBrush;
	float strokeWidth;
	float strokeHeight;
	
	StrokeBrush(PImage brush, PVector pos, float w, float h, color c){
		super(pos, w, c);
		this.imgBrush = brush.copy();
		this.strokeWidth = w;
		this.strokeHeight = h;

		this.imgBrush.resize((int)w, 0);
	}

	void display(){
		imageMode(CENTER);
		pushMatrix();
			translate(strokePosition.x, strokePosition.y);
			rotate(map(red(strokeColor), 0, 255, 0, PI));
			tint(strokeColor, 150);
			image(imgBrush, 0,0);
		popMatrix();
	}
}