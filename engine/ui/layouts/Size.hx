package engine.ui.layouts;

import engine.ui.layouts.Layout;

class Size extends Layout {

	private var Width: Float;
	private var Height: Float;

	public function new(Width: Float, Height: Float, View: View) {
		super(View);

		this.Width = Width;
		this.Height = Height;
	}

	public override function Update(time: Float) : Void {
		super.Update(time);
		


		this.View.Width = Std.int(this.View.Parent.Width * this.Width);
		this.View.Height = Std.int(this.View.Parent.Height * this.Height);
	}

}