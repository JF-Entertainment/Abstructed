package engine.input;

import engine.ui.View;

class Input {

	private var View: View;

	public function new(View: View) {
		this.View = View;
	}

	public function isSupported() : Bool {
		return true;
	}
	
}