package engine.ui.controls;

import engine.ui.controls.Control;

class Button extends Control {
	
	private var Pressed: Bool;

	public override function Load() {
		super.Load();

		this.Pressed = false;

		//Register events
		this.MouseInput.onMouseDown.addListener(this.onMouseDown);
		this.MouseInput.onMouseUp.addListener(this.onMouseUp);

		this.TouchInput.onTouchDown.addListener(this.onTouchDown);
		this.TouchInput.onTouchUp.addListener(this.onTouchUp);

	}

	private function isIntersecting(X: Float, Y: Float) : Bool{
		return (X > 0 && X < this.Width && Y > 0 && Y < this.Height);
	}

	private function onMouseDown(Event: engine.input.MouseEvent) : Void {

		if (isIntersecting(Event.X, Event.Y) && this.Enabled) {
			this.onClick();
			this.Pressed = true;
		}

	}

	private function onMouseUp(Event: engine.input.MouseEvent) : Void {

		if (isIntersecting(Event.X, Event.Y)) {
			this.Pressed = false;
		}

	}

	private function onTouchDown(Event: engine.input.TouchEvent) : Void {

		for (Touch in Event.Touches) {
			if (isIntersecting(Touch.X, Touch.Y) && this.Enabled) {
				this.Pressed = true;
				this.onClick();
			}
		}

	}

	private function onTouchUp(Event: engine.input.TouchEvent) : Void {

		this.Pressed = false;

		for (Touch in Event.Touches) {
			if (isIntersecting(Touch.X, Touch.Y) && this.Enabled) {
				this.Pressed = true;
			}
		}

	}

    public dynamic function onMouseOver() : Void {

    }

    public dynamic function onClick() : Void {

    }

}