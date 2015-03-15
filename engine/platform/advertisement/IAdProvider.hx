package engine.platform.advertisement;

import engine.platform.advertisement.ImmersiveAd;

interface IAdProvider {

	public function preprareImmersiveAd(Ad: ImmersiveAd) : Void;
	public function showImmersiveAd(Ad: ImmersiveAd) : Void;

}