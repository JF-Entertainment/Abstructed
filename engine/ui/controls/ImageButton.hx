package engine.ui.controls;

import engine.graphics.rendering.Canvas;
import engine.ui.controls.Button;
import engine.io.resources.Image;

class ImageButton extends Button {

	private var ImageUnpressed: Image;
	private var ImagePressed: Image;

	public function new(ImageUnpressed: Image, ImagePressed: Image, X = 0, Y = 0, Width = 0, Height = 0) {
        super(X, Y, Width, Height);

        this.ImageUnpressed = ImageUnpressed;
        this.ImagePressed = ImagePressed;
    }

    public override function Draw(e: Canvas) {


    	if (this.Pressed) {
    		//Button is pressed
    		e.drawImage(ImagePressed, 0, 0, this.Width, this.Height);
    	}else{
    		//Button is not pressed
    		e.drawImage(ImageUnpressed, 0, 0, this.Width, this.Height);
    	}

    }

}