package engine.ui.layouts;

import engine.ui.layouts.Layout;

class CenterVertical extends Layout {

	private var Y: Float;

	public function new(Y: Float, View: View) {
		super(View);
		this.Y = Y;
	}

	public override function Update(time: Float) : Void {
		super.Update(time);
		
		this.View.Y = Std.int(this.View.Parent.Height * this.Y - this.View.Height / 2);

	}

}