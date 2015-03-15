package engine.platform.advertisement;

class ImmersiveAd {

	public var Id(default, null): String;
	public var autoShow(default, null): Bool;

	public function new(Id: String, autoShow: Bool = false) {
		this.Id = Id;
		this.autoShow = autoShow;
	} 

}