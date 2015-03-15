package engine.platform.advertisement;

import engine.platform.advertisement.ImmersiveAd;
import engine.platform.advertisement.IAdProvider;

class Html5AdProvider implements IAdProvider {

	public function new() {
		
	}

	public function preprareImmersiveAd(Ad: ImmersiveAd) : Void {
		trace("Preparing immersive ad");
	}

	public function showImmersiveAd(Ad: ImmersiveAd) : Void {
		trace("Showing immersive ad");
	}

}