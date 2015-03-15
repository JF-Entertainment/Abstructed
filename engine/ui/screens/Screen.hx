package engine.ui.screens;

import engine.ui.View;

class Screen extends View {

	public override function Load() : Void {
		super.Load();

		//Keep screen at full size
		this.Layouts.push(new engine.ui.layouts.Size(1, 1, this));
	}

}