package engine.input;

import engine.input.Input;
import engine.ui.View;

import engine.core.events.EventDispatcher;

class MouseInput extends Input {

	public var onMouseMove(default, null): EventDispatcher<engine.input.MouseEvent>;
	public var onMouseDown(default, null): EventDispatcher<engine.input.MouseEvent>;
	public var onMouseUp(default, null): EventDispatcher<engine.input.MouseEvent>;
	public var onMouseClick(default, null): EventDispatcher<engine.input.MouseEvent>;

	public function new(View: View) {
		super(View);

		//Register event-handlers, when someone listens
		this.onMouseMove = new EventDispatcher<engine.input.MouseEvent>();
		this.onMouseUp = new EventDispatcher<engine.input.MouseEvent>();
		this.onMouseDown = new EventDispatcher<engine.input.MouseEvent>();
		this.onMouseClick = new EventDispatcher<engine.input.MouseEvent>();

		this.onMouseMove.onFirstListener = function () { View.Game.OpenFl.stage.addEventListener(openfl.events.MouseEvent.MOUSE_MOVE, this._onMouseMove); }
		this.onMouseUp.onFirstListener = 	function () { View.Game.OpenFl.stage.addEventListener(openfl.events.MouseEvent.MOUSE_UP, this._onMouseUp); }
		this.onMouseDown.onFirstListener = function () { View.Game.OpenFl.stage.addEventListener(openfl.events.MouseEvent.MOUSE_DOWN, this._onMouseDown); }
		this.onMouseClick.onFirstListener = function () { View.Game.OpenFl.stage.addEventListener(openfl.events.MouseEvent.CLICK, this._onMouseClick); }

	}

	private function _onMouseMove(event: openfl.events.MouseEvent) : Void {

        //Initialize new event
        var Event: engine.input.MouseEvent = new engine.input.MouseEvent();
        //Event.X = event.clientX - this.View.AbsoluteX;
        //Event.Y = event.clientY - this.View.AbsoluteY;

        //switch event.button {
		//    case 1: Event.Button = Left;
		//    case 2: Event.Button = Middle;
		//    case 3: Event.Button = Right;
		//}

		Event.Button = Left;

        //Raise event
        this.onMouseMove.Raise(Event);

	}

	private function _onMouseDown(event: openfl.events.MouseEvent) : Void {

        //Initialize new event
        var Event: engine.input.MouseEvent = new engine.input.MouseEvent();
        //Event.X = event.clientX - this.View.AbsoluteX;
        //Event.Y = event.clientY - this.View.AbsoluteY;

        //switch event.button {
		//    case 1: Event.Button = Left;
		//    case 2: Event.Button = Middle;
		//    case 3: Event.Button = Right;
		//}

		Event.Button = Left;

        //Raise event
        this.onMouseDown.Raise(Event);
        
	}

	private function _onMouseUp(event: openfl.events.MouseEvent) : Void {

        //Initialize new event
        var Event: engine.input.MouseEvent = new engine.input.MouseEvent();
        //Event.X = event.clientX - this.View.AbsoluteX;
        //Event.Y = event.clientY - this.View.AbsoluteY;

        //switch event.button {
		//    case 1: Event.Button = Left;
		//    case 2: Event.Button = Middle;
		//    case 3: Event.Button = Right;
		//}

		Event.Button = Left;

        //Raise event
        this.onMouseUp.Raise(Event);
        
	}

	private function _onMouseClick(event: openfl.events.MouseEvent) : Void {

        //Initialize new event
        var Event: engine.input.MouseEvent = new engine.input.MouseEvent();
        //Event.X = event.clientX - this.View.AbsoluteX;
        //Event.Y = event.clientY - this.View.AbsoluteY;

        //switch event.button {
		//    case 1: Event.Button = Left;
		//    case 2: Event.Button = Middle;
		//    case 3: Event.Button = Right;
		//}

		Event.Button = Left;


        //Raise event
        this.onMouseClick.Raise(Event);
        
	}


}