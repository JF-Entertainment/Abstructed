package engine.io.resources;

import engine.io.resources.Resource;

class ResourceManager {

	private var Resources: Map<String, Resource>;
	private var AllResources: Int;
	private var LoadedResources: Int;
	public function new() {

		this.LoadedResources = 0;
		this.AllResources = 0;
		this.Resources = new Map<String, Resource>();

	}

	public function addResource(newResource: Resource) : Void {
		
		//Add to map
		this.Resources.set(newResource.Path, newResource);
		this.AllResources++;
		//Load
		newResource.onLoad = this.onResourceLoad;
		newResource.Load();

	}	

	public function getResource(Path: String) : Dynamic {
		return this.Resources.get(Path);
	}

	private function onResourceLoad() : Void {
		this.LoadedResources++;
		//Check if all resources have been loaded
		if (this.LoadedResources == this.AllResources) this.onLoad();

	}

	public dynamic function onLoad() : Void {

	}
}