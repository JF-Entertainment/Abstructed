package engine.graphics.rendering;

import engine.graphics.rendering.Canvas;

class Buffer {

	public var Canvas: Canvas;

	public function new(Width: Float, Height: Float, Suffix: String = "") {
		//this.Canvas = new Canvas(Width, Height, "Buffer" + Suffix);
	}

	public dynamic function onDraw(e: Canvas) : Void  {

	}

	public function Redraw() : Void{
		this.Canvas.Clear();
		this.onDraw(this.Canvas);
	}

	public function Resize(Width: Float, Height: Float) : Void {
		this.Canvas.Resize(Width, Height);
		this.Redraw();
	}

}