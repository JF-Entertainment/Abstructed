package engine.input;

import engine.core.events.Event;

enum MouseButton {
	Left;
	Middle;
	Right;
}

class MouseEvent extends Event {

	public var X: Float;
	public var Y: Float;
	public var Button: MouseButton;


}

