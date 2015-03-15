package engine.graphics;

class Color {

	public var R: Int;
	public var G: Int;
	public var B: Int;
	public var A: Float;
	public static var Black: Color = new Color(0,0,0);
	public static var White: Color = new Color(255,255,255);
	//TODO: color list

	public function new(R: Int, G: Int, B: Int, A: Float = 1) {
		this.R = R;
		this.G = G;
		this.B = B;
		this.A = A;
	}

}
