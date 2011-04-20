package  
{
	import Assets;
	import Derps.DerpsBasic;
	import Layers.LayerBG;
	import Layers.LayerHazards;
	import Layers.LayerLocations;
	import Layers.LayerTerrain;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class Level extends World 
	{
		private var locations:LayerLocations;
		
		public function Level() 
		{
			// BG Image
			this.add(new LayerBG(Assets.TestLevel_12_0));
			
			// Terrain
			this.add(new LayerTerrain(Assets.TestLevel_10_0, true));
			this.add(new LayerTerrain(Assets.TestLevel_08_0));
			
			// Hazards
			this.add(new LayerHazards(Assets.TestLevel_08_1));
			
			// Locations
			locations = new LayerLocations(Assets.TestLevel_06_0);
			this.add(locations);
			
			this.add(new DerpsBasic(locations.startPoint.x,locations.startPoint.y));
			this.add(new DerpsBasic(400,40));
			
		}
		
	}

}