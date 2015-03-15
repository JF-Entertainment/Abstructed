package engine.ui.controls;

import engine.graphics.rendering.Canvas;
import engine.graphics.rendering.Buffer;
import engine.graphics.Color;
import engine.ui.controls.Control;
import engine.io.resources.Font;

class Label extends Control {
	
	public var Text: String;
	public var Font: Font;
	public var Color: Color;
	private var Buffer: Buffer;

	public function new(Text: String, Color: Color, Font: Font, X = 0, Y = 0, Width = 0, Height = 0) {
		super(X, Y, Width, Height);

		this.Text = Text;
		this.Font = Font;
		this.Color = Color;
	}

	public override function Load() : Void {
		super.Load();

		//Intialize buffer
		this.Buffer = new Buffer(this.Width, this.Height);
		this.Buffer.onDraw = this.DrawBuffer;
		this.Buffer.Redraw();

	}

	public function DrawBuffer(e: Canvas) : Void {
		e.drawText( this.Text, this.Color, this.Font, 0, 50, this.Width);

	}

	public override function Draw(e: Canvas) : Void {

		e.drawBuffer(this.Buffer, 0, 0);
	}	


}