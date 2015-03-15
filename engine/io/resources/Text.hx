package engine.io.resources;

import engine.io.resources.Resource;
import openfl.Assets;

class Text extends Resource {


	public var Data: String;

	public override function Load() {
		super.Load();

		Assets.loadText(this.Path, function(Text):Void{
			this.Data = Text;
			this.onLoad();
		});

	}

}