package Layers  
{
	import Assets;
	import flash.display.BitmapData;
	import flash.display.Shader;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.display.BlendMode;
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
		
		public function removeCircle(X:int, Y:int, RADIUS:int):void
		{
			if (isDestructable)
			{
				var bmd:BitmapData = new BitmapData(terrainImage.width, terrainImage.height, true, 0);
				terrainImage.render(bmd, FP.camera, FP.camera);
			
				var chunk:Shape = new Shape();
				chunk.graphics.clear();
				chunk.graphics.beginFill(0xFF0000, 1.0);
				chunk.graphics.drawCircle(X, Y, RADIUS);
				chunk.graphics.endFill();
				
				bmd.draw(chunk, chunk.transform.matrix, new ColorTransform(), BlendMode.ERASE);
				
				terrainImage = new Image(bmd);
				graphic = terrainImage;
				mask = new Pixelmask(bmd);				
			}
		}
		
		public function removeRect(X:int, Y:int, W:int, H:int):void
		{
			if (isDestructable)
			{
				var bmd:BitmapData = new BitmapData(terrainImage.width, terrainImage.height, true, 0);
				terrainImage.render(bmd, FP.camera, FP.camera);
			
				var chunk:Shape = new Shape();
				chunk.graphics.clear();
				chunk.graphics.beginFill(0xFF0000, 1.0);
				chunk.graphics.drawRect(X, Y, W, H);
				chunk.graphics.endFill();
				
				bmd.draw(chunk, chunk.transform.matrix, new ColorTransform(), BlendMode.ERASE);
				
				terrainImage = new Image(bmd);
				graphic = terrainImage;
				mask = new Pixelmask(bmd);				
			}
		}
		
		
	}

}