package engine.utils.helpers;

class GameLoopHelper{

	public static function Start(Callback: Float -> Void) {

		var timer = new haxe.Timer( 16 ); // 60fps
		timer.run = function() { Callback(16); }

	}

}