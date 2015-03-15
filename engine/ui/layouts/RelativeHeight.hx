package engine.ui.layouts;

import engine.ui.layouts.Layout;

class RelativeHeight extends Layout {

	private var Height: Float;
	private var min: Int;
	private var max: Int;
	private var Resolution: Float;

	public function new(Height: Float, View: View, min: Int = 0, max: Int = 0) {
		super(View);
		this.Height = Height;
		this.min = min;
		this.max = max;
		this.Resolution = View.Height / View.Width;
	}

	public override function Update(time: Float) : Void {
		super.Update(time);
		
		this.View.Height = Std.int(this.View.Parent.Height * this.Height);

		if (this.max != 0 && this.max < this.View.Height) this.View.Height = this.max;
		if (this.min > this.View.Height) this.View.Height = this.min;

		this.View.Width = Std.int(this.View.Height * this.Height / this.Resolution);
	}

}