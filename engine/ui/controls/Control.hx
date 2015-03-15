package engine.ui.controls;

import engine.ui.View;

class Control extends View {
	
	public var Enabled: Bool;

	public function new(X = 0, Y = 0, Width = 0, Height = 0) {
		super(X, Y, Width, Height);

		this.Enabled = true;
	}

}