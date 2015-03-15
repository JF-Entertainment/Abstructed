package engine.ui;

import engine.core.events.Event;

class ResizeEvent extends Event {

	public var Width: Float;
	public var Height: Float;

	public function new(Width: Float, Height: Float) {
		super();
		this.Width = Width;
		this.Height = Height;
	}

}

