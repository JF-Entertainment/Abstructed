package engine.input;

import engine.input.Input;
import engine.ui.View;

import engine.core.events.EventDispatcher;
import engine.input.KeyboardEvent;

import openfl.events.KeyboardEvent;

class KeyboardInput extends Input {

	public var onKeyDown(default, null): EventDispatcher<engine.input.KeyboardEvent>;
	public var onKeyUp(default, null): EventDispatcher<engine.input.KeyboardEvent>;

	public function new(View: View) {
		super(View);

		//Register event-handlers, when someone listens
		this.onKeyDown = new EventDispatcher<engine.input.KeyboardEvent>();
		this.onKeyUp = new EventDispatcher<engine.input.KeyboardEvent>();

		this.onKeyDown.onFirstListener = function () { View.Game.OpenFl.stage.addEventListener(openfl.events.KeyboardEvent.KEY_DOWN, this._onKeyDown); }
		this.onKeyUp.onFirstListener = 	function () { View.Game.OpenFl.stage.addEventListener(openfl.events.KeyboardEvent.KEY_UP, this._onKeyUp); }


	}

	private function _onKeyDown(event: openfl.events.KeyboardEvent) : Void {

        //Initialize new event
        var Event: engine.input.KeyboardEvent = new engine.input.KeyboardEvent();
        Event.KeyCode = event.keyCode;
        //Raise event
        this.onKeyDown.Raise(Event);

	}

	private function _onKeyUp(event: openfl.events.KeyboardEvent) : Void {

        //Initialize new event
        var Event: engine.input.KeyboardEvent = new engine.input.KeyboardEvent();
        Event.KeyCode = event.keyCode;
        //Raise event
        this.onKeyUp.Raise(Event);
        
	}

}