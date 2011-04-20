package Derps 
{
	import Assets;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsBasic extends Entity 
	{		
		protected var sprite:Spritemap;
		protected var facingRight:Boolean = true;
		
		protected var gravity:Number = 10;
		protected var speed:Number = 100;
		protected var velocity:Point = new Point();
		
		public function DerpsBasic(X:int = 0, Y:int = 0):void
		{
			setPos(X, Y);
			setHitbox(32, 32);
			layer = 4;
		}
		
		override public function update():void 
		{
			var prevY:Number = y;
			var prevX:Number = x;
			
			if (!collide('Terrain',x,y))
			{
				velocity.y += FP.elapsed;
				velocity.x = 0;
				
				if (velocity.y > gravity)
				{
					velocity.y = gravity;
				}
			}
			else if (velocity.x == 0)
			{
				velocity.y = 0;

				while (collide('Terrain', x, y))
				{
					y--;
				}
				
				y++;
				
				velocity.x = speed;
			}
			
			x += velocity.x*FP.elapsed;
			y += velocity.y;
			
			var tempBool:Boolean = false;
			
			if (velocity.x != 0)
			{		
				for (var i:int = y; i > y - 5; i--)
				{
					if (!collide("Terrain", x, i) && !tempBool)
					{
							y -= y - i;
							tempBool = true;
					}
				}				
				y++;
				
				if (!tempBool)
				{
					x -= velocity.x*FP.elapsed;
				}
			}
			
			if (x == prevX && velocity.x != 0)
			{
				velocity.x *= -1;
				x += velocity.x*FP.elapsed;
			}
			
			super.update();
		}
		
		public function setPos(X:int, Y:int):void
		{
			x = X;
			y = Y;
		}
	}

}