package engine.input;

import engine.core.events.Event;
import engine.utils.math.Vector2;

class TouchEvent extends Event {

	public var Touches: Array<Vector2>;

	public function new() {
		super();
		
		this.Touches = new Array<Vector2>();
	}

}

