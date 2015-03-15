package engine.input;

import engine.input.Input;
import engine.ui.View;

import engine.core.events.EventDispatcher;
import engine.input.TouchEvent;
import engine.utils.math.Vector2;

class TouchInput extends Input {

	public var onTouchMove(default, null): EventDispatcher<TouchEvent>;
	public var onTouchDown(default, null): EventDispatcher<TouchEvent>;
	public var onTouchUp(default, null): EventDispatcher<TouchEvent>;

	public function new(View: View) {
		super(View);

		//Register event-handlers, when someone listens
		this.onTouchMove = new EventDispatcher<TouchEvent>();
		this.onTouchUp = new EventDispatcher<TouchEvent>();
		this.onTouchDown = new EventDispatcher<TouchEvent>();

		//this.onTouchMove.onFirstListener = function () { View.Game.Canvas.Element.addEventListener("touchmove", this._onTouchMove); }
		//this.onTouchUp.onFirstListener = 	function () { View.Game.Canvas.Element.addEventListener("touchend", this._onTouchUp); }
		//this.onTouchDown.onFirstListener = function () { View.Game.Canvas.Element.addEventListener("touchstart", this._onTouchDown); }


	}

	private function _onTouchMove(event: Dynamic) : Void {

        //Initialize new event
        var Event: TouchEvent = new TouchEvent();
    	//for (Touch in event.targetTouches) {
			//Event.Touches.push(new Vector2( Touch.clientX - this.View.AbsoluteX , Touch.clientY - this.View.AbsoluteY ));
		//}    

        //Raise event
        this.onTouchMove.Raise(Event);

	}

	private function _onTouchDown(event: Dynamic) : Void {

        //Initialize new event
        var Event: TouchEvent = new TouchEvent();
    	//for (Touch in event.targetTouches) {
			//Event.Touches.push(new Vector2( Touch.clientX - this.View.AbsoluteX , Touch.clientY - this.View.AbsoluteY ));
		//}    

        //Raise event
        this.onTouchDown.Raise(Event);
        
	}

	private function _onTouchUp(event: Dynamic) : Void {

		//Prevent mouse-click
		event.preventDefault();

        //Initialize new event
        var Event: TouchEvent = new TouchEvent();
    	//for (Touch in event.targetTouches) {
			//Event.Touches.push(new Vector2( Touch.clientX - this.View.AbsoluteX , Touch.clientY - this.View.AbsoluteY ));
		//}    

        //Raise event
        this.onTouchUp.Raise(Event);
        
	}

}