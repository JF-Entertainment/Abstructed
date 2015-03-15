package engine.ui.layouts;

import engine.ui.layouts.Layout;

class CenterHorizontal extends Layout {

	private var X: Float;

	public function new(X: Float, View: View) {
		super(View);
		this.X = X;
	}

	public override function Update(time: Float) : Void {
		super.Update(time);
		
		this.View.X = Std.int(this.View.Parent.Width * this.X - this.View.Width / 2);

	}

}