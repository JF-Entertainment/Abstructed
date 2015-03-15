package engine.core.events;

import engine.core.events.Event;

class EventDispatcher<E>{

	public var Event(default, null): E;
	private var Listeners: Array<E -> Void>;
	public var hasListener: Bool;

	public function new() {
		this.Listeners = new Array<E -> Void>();
		this.hasListener = false;
	}

	public function addListener(Listener: E -> Void) : Void {
		this.Listeners.push(Listener);

		if (this.Listeners.length == 1) {
			this.onFirstListener();
			this.hasListener = true;
		}

	}

	public dynamic function onFirstListener() : Void {

	}

	public function Raise(Event: E) : Void {

		for (Listener in this.Listeners) {
			Listener(Event);
		}

	}

}