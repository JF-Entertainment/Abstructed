package engine.io.resources;

import engine.io.resources.Resource;

class Font extends Resource {

	public var Name(default, null): String;
	public var Size: Float;
	public var LineHeight: Float;


	public function new(Name: String, Size: Float, Path: String = "") {
		super(Path);
		this.Name = Name;
		this.Size = Size;
		this.LineHeight = 1;
	}

	public override function Load() {
		//TODO Dynamic font loading
	}


}