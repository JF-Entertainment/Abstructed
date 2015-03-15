package engine.core;

import engine.core.State;

interface IUpdateable{
	
	public var State: State;

	public function Update(elapsed:Float) : Void;
	public function Pause() : Void;
	public function Unpause() : Void;
	public function Delete() : Void;


}