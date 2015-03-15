package engine.platform;

import engine.graphics.rendering.Canvas;

interface IDevice {

	public function ShareText(Message: String) : Void;
	public function ShareImage(Image: Canvas, Message: String = null) : Void;
}