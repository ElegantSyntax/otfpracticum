package Layers  
{
	import Assets;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class LayerTerrain extends Entity 
	{
		public var isDestructable:Boolean;
		public var   terrainImage:Image;
		
		public function LayerTerrain(TERRAINIMAGE:Class, ISDESTRUCTABLE:Boolean = false, X:int = 0, Y:int = 0) 
		{
			terrainImage = new Image(TERRAINIMAGE);
			graphic = terrainImage;
			
			isDestructable = ISDESTRUCTABLE;
			
			x = X;
			y = Y;
			
			layer = 10;
			type = "Terrain";
			
			updateMask();
		}
		
		public function updateMask():void
		{
			var bmd:BitmapData = new BitmapData(terrainImage.width, terrainImage.height, true, 0);
			terrainImage.render(bmd, FP.camera, FP.camera);
			mask = new Pixelmask(bmd);
		}
		
		
	}

}