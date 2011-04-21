package  
{
	import Assets;
	import Pointer;	
	import Derps.DerpsBasic;
	import Derps.DerpsFallers;
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
		private var   pointer:Pointer;
		private var locations:LayerLocations;
		private var     width:int = 0;
		private var    height:int = 0;
		
		public function Level(W:int = 800, H:int = 480) 
		{
			width = W;
			height = H;
			
			// Pointer
			pointer = new Pointer();
			this.add(pointer);
			
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
			
			this.add(new DerpsFallers(locations.startPoint.x,locations.startPoint.y));
			//this.add(new DerpsBasic(400,40));
			
		}
		
		override public function update():void 
		{
			
			// Camera Controls
			cameraLogic();
			cameraBounds();
			
			super.update();
		}
		
		private function cameraLogic():void
		{
			if (pointer.pointerState == Pointer.drag)
			{
				FP.camera.x += pointer.dragPoint.x/-25;
				FP.camera.y += pointer.dragPoint.y/-25;
			}
			else if (pointer.dragPoint.x != 0 || pointer.dragPoint.y != 0 )
			{
				if (pointer.dragPoint.x > 0)
				{
					pointer.dragPoint.x -= pointer.dragPoint.x/20;
				}
				else if (pointer.dragPoint.x < 0)
				{
					pointer.dragPoint.x += pointer.dragPoint.x/-20;
				}
				
				if (pointer.dragPoint.y > 0)
				{
					pointer.dragPoint.y -= pointer.dragPoint.y/20;
				}
				else if (pointer.dragPoint.y < 0)
				{
					pointer.dragPoint.y += pointer.dragPoint.y/-20;
				}
				
				FP.camera.x += pointer.dragPoint.x/-25;
				FP.camera.y += pointer.dragPoint.y/-25;
			}
		}
		
		private function cameraBounds():void
		{
			// Camera Limits
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
		}
		
	}

}