package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
		import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Martin Copp
	 */
	public class Player extends Entity 
	{
		
		[Embed(source = 'assets/player.png')]
		public static const img:Class;
		public var ourimage:Image;
		
		public function Player() 
		{
			ourimage = new Image(img);
			graphic = ourimage;
			setHitbox(10, 6, -2, -15);
		}
		
		
		/**
		 * He just fall down until collide  
		 * our walls
		 */
		override public function update():void 
		{
			
			if (!collide('level',x,y))
			{
				y++;
			}
			
			if (Input.check(Key.LEFT))
			{
				x--;
				
				for (var i:int = y; i > y - 5; i--)
				{
					if (!collide("level", x, i))
					{
						y -= y - i;
						return;
					}
				}
				
				x++;
			}
			
			if (Input.check(Key.RIGHT))
			{
	
				
				x++;
				
				for (var i:int = y; i > y - 5; i--)
				{
					if (!collide("level", x, i))
					{
						y -= y - i;
						return;
					}
				}
				
				x--;
			}
			
			super.update();
		}
		
		private function updateMask():void
		{
			var bmd:BitmapData = new BitmapData(640, 480, true, 0); //create new BitmapData object
				ourimage.render(bmd, new Point(0, 0), new Point(FP.camera.x, FP.camera.y)); //get BitmapData from tileSet
				mask = new Pixelmask(bmd);	//redraw level pixelMask
		}
		
		
	}

}