package engine.platform.advertisement;

import engine.platform.advertisement.ImmersiveAd;
import engine.platform.advertisement.IAdProvider;

class PhonegapAdProvider implements IAdProvider {

	public function new() {
		
	}

	public function preprareImmersiveAd(Ad: ImmersiveAd) : Void {
		untyped __js__("AdMob.prepareInterstitial({ adId: Ad.Id, autoShow: Ad.autoShow })");
	}

	public function showImmersiveAd(Ad: ImmersiveAd) : Void {
		untyped __js__("AdMob.showInterstitial()");
	}

}