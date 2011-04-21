package  
{
import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	
	/**
	 * Destructible level class
	 * @author liss
	 */
	public class Level extends Entity
	{
		
		[Embed(source='assets/tiles_bricks.png')]	//tilemap asset
		public static var blocks:Class;
		
		private var blowRadius:Number = 20; //radius of our circle blow
		
		public var curImg:Image;
		
		public function Level() 
		{
			curImg = new Image(blocks);

			graphic = curImg;
			
			this.x = 100; this.y = 200;
			
			type = 'level';
			
			updateMask()	//draw pixelMask of level
		}
		
		override public function update():void 
		{
			//when user click on walls
			if(Input.mouseReleased){
				if (collidePoint(x, y,world.mouseX,world.mouseY))
				{
					//we make holes ! ))
					drill(world.mouseX,world.mouseY,blowRadius);
				};
			}
			super.update();
		}
		
		/**
		 * @method updateMask() 
		 * draws pixelMask based on tileMap BitmapData
		 */
		private function updateMask():void
		{
			var bmd:BitmapData = new BitmapData(640, 480, true, 0); //create new BitmapData object
				curImg.render(bmd, new Point(0, 0), new Point(FP.camera.x, FP.camera.y)); //get BitmapData from tileSet
				mask = new Pixelmask(bmd);	//redraw level pixelMask
		}
		
		/**
		 * @method drill
		 * let's make holes in our tilemMap
		 * 
		 * @param bx,by - coordinates
		 * @param bRad - blow radius
		 */
		private function drill(bx:Number,by:Number,bRad:Number):void
		{
			//
			// i choosed circle holes. You may prefer other form.
			//
				var blow:Image = new Image(Player.img);
				
				//
				
				var bmd:BitmapData = new BitmapData(curImg.width, curImg.height, true);
			
				curImg.render(bmd, new Point(0, 0), new Point(0, 0));
				
				var circle:Shape = new Shape();
				
				circle.graphics.clear();
				circle.graphics.beginFill(0xFF0000, 1.0);
				circle.graphics.drawCircle(0, 0, 100);
				circle.graphics.endFill();
				
				bmd.draw(circle, circle.transform.matrix, new ColorTransform(), BlendMode.ERASE);
				//Use this to add objects to the bitmap.
				//bmd.draw(circle, circle.transform.matrix, new ColorTransform(), BlendMode.ADD);
				
				curImg = new Image(bmd);
				
				graphic = curImg;
				
				mask = new Pixelmask(bmd);
				
				//tiles.drawGraphic(bx - blow.width / 2, by - blow.height / 2, blow);  //add hole to tileMap
				//updateMask(); //redraw pixelMask of level
		}
	}


}