package engine.ui;

import engine.graphics.rendering.Canvas;
import engine.core.IUpdateable;
import engine.core.State;
import engine.core.Game;
import engine.ui.layouts.Layout;
import engine.core.events.EventDispatcher;
import engine.ui.ResizeEvent;

/*
* General View
*/
class View implements IUpdateable{

    public var X: Float;
    public var Y: Float;
    public var AbsoluteX: Float;
    public var AbsoluteY: Float;
    public var Width: Float;
    public var Height: Float;
    public var Children: Array<View>;
    public var Parent:View;
    public var Game: Game;
    public var State: State;
    public var Layouts: Array<Layout>;

    //Events
    public var onResize(default, null): EventDispatcher<ResizeEvent>;

    //Inputs
    public var KeyboardInput(default, null): engine.input.KeyboardInput;
    public var MouseInput(default, null): engine.input.MouseInput;
    public var TouchInput(default, null): engine.input.TouchInput;

    public function new(X: Float = 0, Y: Float = 0, Width: Float = 0, Height: Float = 0) {

        this.onResize = new EventDispatcher<ResizeEvent>();

        //Initialize attributes
        this.X = X;
        this.Y = Y;
        this.AbsoluteX = this.X;
        this.AbsoluteY = this.Y;
        this.Width = Width;
        this.Height = Height;
        this.State = Active;
        this.Children = new Array<View>();
        this.Layouts = new Array<Layout>();

    }

    /*
    * Called when view is added to the game.
    */
    public function Load() : Void{

        //If size is not set -> equal to parents size
        this.Width = this.Width == 0 ? this.Parent.Width : this.Width;
        this.Height = this.Height == 0 ? this.Parent.Height : this.Height;

        this.KeyboardInput = new engine.input.KeyboardInput(this);
        this.MouseInput = new engine.input.MouseInput(this);
        this.TouchInput = new engine.input.TouchInput(this);
    }

    public function Unload() : Void{

    }

    public function Update(time :Float) : Void{

        var oldWidth: Float = this.Width,
            oldHeight: Float = this.Height;

        //Update Layouts
        for (Layout in this.Layouts) {
            Layout.Update(time);
        }
        //Check for changes
        if (oldWidth != this.Width || oldHeight != this.Height) this.onResize.Raise(new ResizeEvent(this.Width, this.Height));


        var i:Int = 0;
        while (i < this.Children.length) {

            //Remove children, who have been flagged "Deleted"
            if (this.Children[i].State == Deleted) {
                //Unload child
                this.Children[i].Unload();
                //Delete Child and skip step
                this.Children.splice(i, 1);
                i++;
                //TODO: check if necessary
                if (i >= this.Children.length) break;
            }

            //Calculate Width and Height
            this.Children[i].AbsoluteX = this.AbsoluteX + this.Children[i].X;
            this.Children[i].AbsoluteY = this.AbsoluteY + this.Children[i].Y;


            //Call children if not paused
            if (this.Children[i].State != Paused) this.Children[i].Update(time);

            i++;
        }


    }

    public function Draw(e: Canvas) : Void{

        for (Child in this.Children) {

            //Translate canvas and call children
            e.Translate(Child.X, Child.Y);
            Child.Draw(e);
            e.Translate(-Child.X, -Child.Y);

        }

    }

    public function addView(NewView: View) : Void{

        //Set & link attributes
        NewView.Parent = this;
        NewView.Game  = this.Game;

        //Add to array
        this.Children.push(NewView);

        //Load new view
        NewView.Load();

    }

    public function addLayout(NewLayout: Layout) : Void {
        this.Layouts.push(NewLayout);
    }

    public function setView(NewView: View) : Void{

        //Empty array
        this.Children = new Array<View>();
        //Add new child
        this.addView(NewView);

    }

    public  function Delete() : Void{
        this.State = Deleted;
    }

    public function Pause() : Void{
        this.State = Paused;
    }

    public function Unpause() : Void{
        this.State = Active;
    }



}
