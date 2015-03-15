package engine.utils.helpers;

//see -> https://gist.github.com/gre/1650294
enum AnimationAlgorithm{
	Linear;
	EaseInOut;
}

class Animation {
	
	private var Enabled(default, null): Bool;
	public var Finished(default, null): Bool;

	private var Start(default, null): Float;
	private var End(default, null): Float;
	public var Value(default, null): Float;

	private var Duration(default, null): Float;
	private var Elapsed: Float;

	private var Timing(default, null): AnimationAlgorithm;

	public function new(Start: Float, End: Float, Duration: Float, Timing: AnimationAlgorithm) : Void {

		this.Start = Start;
		this.End = End;
		this.Duration = Duration;
		this.Timing = Timing;
		this.Reset();

	}

	public function Update(elapsed: Float) : Void {

		if (this.Enabled) {

			//Add timer
			this.Elapsed += elapsed;

			//Check if timer has reached duration
			if (this.Elapsed < this.Duration) {
				this.Finished = false;
			}else{
				this.Finished = true;
				this.Elapsed = this.Duration;
				this.onFinish();
			}

			//Get Value
			switch (this.Timing) {
		      case Linear: this.Value = this.Linear(this.Elapsed / this.Duration) * (this.End - this.Start) + Start;
		      case EaseInOut: this.Value = this.EaseInOut(this.Elapsed / this.Duration) * (this.End - this.Start) + Start;
		    }

		}

	}


	private function Linear(t: Float) : Float {
		return t;
	}

	private function EaseInOut(t: Float) : Float {
		return t<.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1;
	}

	public dynamic function onFinish() : Void {

	}

	public function Run() : Void {
		this.Enabled = true;
	}

	public function Stop() : Void {
		this.Enabled = false;
	}

	public function Reset() : Void {
		this.Enabled = false;
		this.Value = this.Start;
		this.Elapsed = 0;
		this.Finished = false;
	}
}