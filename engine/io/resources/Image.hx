package engine.io.resources;

import engine.io.resources.Resource;

import openfl.display.BitmapData;
import openfl.Assets;

class Image extends Resource {


	public var Width(default, null): Int;
	public var Height(default, null): Int;
	public var Data: BitmapData;

	public override function Load() {
		super.Load();

		Assets.loadBitmapData(this.Path, function(Image):Void{
			this.Data = Image;

			this.Width = this.Data.width;
			this.Height = this.Data.height;

			this.onLoad();
		});

	}

}