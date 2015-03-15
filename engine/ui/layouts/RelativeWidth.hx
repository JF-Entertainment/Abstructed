package engine.ui.layouts;

import engine.ui.layouts.Layout;

class RelativeWidth extends Layout {

	private var Width: Float;
	private var min: Int;
	private var max: Int;
	private var Resolution: Float;

	public function new(Width: Float, View: View, min: Int = 0, max: Int = 0) {
		super(View);
		this.Width = Width;
		this.min = min;
		this.max = max;
		this.Resolution = View.Width / View.Height;
	}

	public override function Update(time: Float) : Void {
		super.Update(time);
		
		this.View.Width = Std.int(this.View.Parent.Width * this.Width);

		if (this.max != 0 && this.max < this.View.Width) this.View.Width = this.max;
		if (this.min > this.View.Width) this.View.Width = this.min;

		this.View.Height = Std.int(this.View.Width * this.Width / this.Resolution);
	}

}