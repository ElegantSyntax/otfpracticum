package Layers
{
	import Assets;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class LayerBG extends Entity 
	{
		public var bgImage:Image;
		
		public function LayerBG(BGIMAGE:BitmapData, X:int = 0, Y:int = 0) 
		{
			bgImage = new Image(BGIMAGE);
						
			graphic = bgImage;
			
			x = X;
			y = Y;
			
			layer = 12;
			type = "BG";
		}
		
	}

}