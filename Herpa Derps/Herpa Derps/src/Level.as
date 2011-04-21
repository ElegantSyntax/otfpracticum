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
		private var width:int = 0;
		private var height:int = 0;
		
		public function Level(W:int = 800, H:int = 480) 
		{
			width = W;
			height = H;
			
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
			//this.add(new DerpsBasic(400,40));
			
		}
		
		override public function update():void 
		{
			if (FP.camera.x < 0)
			{
				FP.camera.x = 0;
			}
			else if (FP.camera.x + FP.screen.width > width)
			{
				FP.camera.x = width - FP.screen.width;
			}
			
			if (FP.camera.y < 0)
			{
				FP.camera.y = 0;
			}
			else if (FP.camera.y + FP.screen.height > height)
			{
				FP.camera.y = height - FP.screen.height;
			}
			
			super.update();
		}
		
	}

}