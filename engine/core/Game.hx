package engine.core;

import engine.ui.View;
import engine.utils.helpers.GameLoopHelper;
import engine.graphics.rendering.Canvas;
import engine.io.resources.ResourceManager;
import engine.platform.IDevice;

import openfl.Lib;

import openfl.display.Sprite;

class Game extends View {

    public var Device: IDevice; //Access to all platform-related apis
    public var Canvas: Canvas; //Drawing interface
    public var OpenFl: Sprite; //Main sprite of OpenFl
    public var ResourceManager: ResourceManager;

    public function new(OpenFl: Sprite) {

        this.OpenFl = OpenFl;

        //Initialize parent
        super(0, 0, Lib.current.stage.stageWidth, Lib.current.stage.stageHeight);

        this.Canvas = new Canvas(this.OpenFl, this.Width, this.Height);
        this.ResourceManager = new ResourceManager();

        //Start gameloop
        GameLoopHelper.Start(this.Update);

        this.Game = this;
        
    }


    public override function Load() : Void {
    	super.Load();

        //Start Gameloop
        GameLoopHelper.Start(this.Update);

    }

    public override function Update(time:Float) : Void {

        //Clear screen
        this.Canvas.Clear();

        //Update screen dimensions
        this.Width = Lib.current.stage.stageWidth;
        this.Height = Lib.current.stage.stageHeight;

        //Update game
        super.Update(time);

        //Call Draw-Methods
        this.Draw(this.Canvas);
    }

}
