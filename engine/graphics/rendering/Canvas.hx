package engine.graphics.rendering;

import engine.graphics.rendering.Buffer;
import engine.io.resources.Image;
import engine.io.resources.Font;
import engine.utils.math.Size2;
import engine.utils.math.Vector2;

import openfl.display.Graphics;
import openfl.geom.Matrix;
import openfl.display.Sprite;


class Canvas {

	public var Graphics(default, null): Graphics;
	public var Matrix: Matrix;
	private var Sprite(default, null): Sprite;

	public function new(Sprite: Sprite, Width: Float, Height: Float){

		this.Sprite = Sprite;
		this.Graphics = Sprite.graphics;
		this.Matrix = new Matrix();

	}

	public function Resize(Width: Float, Height: Float) : Void {
		//this.Element.width = Std.int(Width);
		//this.Element.height = Std.int(Height);
	}

	public function Clear() : Void {
        this.Graphics.clear();
    }

	public function Translate(X: Float, Y: Float) : Void {
        this.Matrix.translate(X, Y);
    }

	public function Scale(Width: Float, Height: Float) : Void {
        //this.Matrix.scale(Width, Height);
    }

	public function Rotate(Radians: Float) : Void {
		//this.Matrix.rotate(Radians);
	}

	public function fillRectangle(Color: Color, X:Float, Y:Float, Width:Float, Height:Float) : Void {

		this.Graphics.beginFill( this.getColorHex(Color) , Color.A);
        this.Graphics.drawRect(X + this.Matrix.tx, Y + this.Matrix.ty, Width, Height);
        this.Graphics.endFill();

    }

	public function drawRectangle(Color: Color, LineWidth:Float, X:Float, Y:Float, Width:Float, Height:Float) : Void {

		this.Graphics.lineStyle( LineWidth, this.getColorHex(Color) , Color.A);
        this.Graphics.drawRect(X + this.Matrix.tx, Y + this.Matrix.ty, Width, Height);
        this.Graphics.endFill();

    }

    public function drawPolygon(Points: Array<Vector2>, Color: Color, LineWidth:Float) : Void {

		this.Graphics.lineStyle( LineWidth, this.getColorHex(Color) , Color.A);
        
        if (Points.length < 0) this.Graphics.moveTo(Points[0].X, Points[0].Y);
		for (Point in Points) {
			this.Graphics.lineTo(Point.X + this.Matrix.tx, Point.Y + this.Matrix.ty);
		}

        this.Graphics.endFill();

    }


	public function drawImage(Image: Image, X: Float, Y: Float, Width: Float = 0, Height: Float = 0, sX: Float = 0, sY: Float = 0, sWidth: Float = 0, sHeight: Float = 0) : Void {

		if (Width == 0) Width = Image.Width;
		if (Height == 0) Height = Image.Height;
		if (sWidth == 0) sWidth = Image.Width;
		if (sHeight == 0) sHeight = Image.Height;

		var ImageMatrix: Matrix = new Matrix();


		//Scale and translate image accordingly
		ImageMatrix.translate(sX, sY);
		ImageMatrix.scale(Width/sWidth,Height/sHeight);
		ImageMatrix.translate(this.Matrix.tx + X, this.Matrix.ty + Y);

		this.Graphics.beginBitmapFill(Image.Data, ImageMatrix);
		this.Graphics.drawRect(X + this.Matrix.tx, Y + this.Matrix.ty, Width, Height);

	}

	public function drawBuffer(Buffer: Buffer, X: Float, Y: Float) : Void {

		//this.Context.drawImage(Buffer.Canvas.Element, X, Y);
	}

	public function measureText(Text: String, Font: Font, maxWidth: Float = 0) : Size2 {
		this.setFont(Font);

		var LongestLine: Float = 0,
			y: Int = 0;

		//Go trough all lines and determine longest
		for (Line in this.getTextLines(Text, Font, maxWidth)) {
			y++;

			//var Length: Float = this.Context.measureText(Line).width;
			//if (Length > LongestLine) LongestLine = Length;

		}

		//Return longest
		return new Size2(LongestLine, y * Font.Size * Font.LineHeight);
	}

	public function drawText(Text: String, Color: Color, Font: Font, X: Float, Y: Float, maxWidth: Float = 0) : Void {
		this.setFont(Font);
		//this.Context.fillStyle = this.getColor(Color);

		var i:Int = 0;
		//Go trough each line and draw it
		for (Line in this.getTextLines(Text, Font, maxWidth)) {

			//Draw
			//this.Context.fillText( Line, X, Y + (i * Font.Size * Font.LineHeight));

			i++;
		}

	}

	public function strokeText(Text: String, Color: Color, Font: Font, LineWidth:Float, X: Float, Y: Float, maxWidth: Float = 0) : Void {
		this.setFont(Font);

		//Intialize line
		//this.Context.strokeStyle = this.getColor(Color);
        //this.Context.lineWidth = LineWidth;

		var i:Int = 0;
		//Go trough each line and draw it
		for (Line in this.getTextLines(Text, Font, maxWidth)) {

			//Draw
			//this.Context.strokeText( Line, X, Y + (i * Font.Size * Font.LineHeight));

			i++;
		}

	}

	//TODO: Add breakline detection
	private function getTextLines(Text: String, Font: Font, maxWidth: Float) : Array<String> {

		//If maxWidth is 0 -> return Text
		if (maxWidth == 0) return [Text];

		//Split string in words
		var Words: Array<String> = Text.split(" ");
		if (Words.length <= 1) return [Text];

		//Check how many words fit in one line
		for( i in 0...Words.length + 1 ) {

			//Recombine array to sentence with i words
			var Line: String = Words.slice( 0, i).join(" ");

			//Test for length
			this.setFont(Font);
			////if (this.Context.measureText(Line).width  > maxWidth) {

				//Line to long
				//Return Line - 1 Word and recursively parse rest of text
				////return [ Words.slice( 0, i - 1).join(" ") ].concat( this.getTextLines(Words.slice(i - 1).join(" "), Font, maxWidth) );
			////}

		}

		//Text is shorter as maxWidth -> return
		return [Text];

    }




	private function setFont(Font: Font) : Void {
		//this.Context.font = Std.string(Font.Size) + "px " + Font.Name;
		//this.Context.textBaseline = "top";
	}

	private function getColorHex(Color: Color) : UInt{
		//Convert rgb to hex
		return (Color.R & 0xFF) << 16 | (Color.G & 0xFF) << 8 | (Color.B & 0xFF);
	}

	private function updateMatrix() : Void {

		//this.Sprite.transform.matrix = this.Matrix;

	}

}