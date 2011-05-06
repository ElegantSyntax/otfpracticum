package Derps 
{
	import Assets;
	import flash.geom.Point;
	import Layers.LayerHazards;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsBasic extends Entity 
	{	
		public static const   notDead:int = 0;
		public static const   falling:int = 1;
		public static const    hazard:int = 2;
		public static const explosion:int = 3;
		public static const   special:int = 4;
		
		protected var          sprite:Spritemap;
		public var     facingRight:Boolean = true;
		
		protected var         gravity:Number = .15;
		protected var           speed:Number = 1.5;
		protected var        velocity:Point  = new Point();
		
		protected var       hitPoints:int = 10;
		protected var    causeOfDeath:int = notDead;
		
		public    var      isClimbing:Boolean = false;
		
		public function DerpsBasic(X:int = 0, Y:int = 0, FACINGRIGHT:Boolean = true)
		{
			setPos(X, Y);
			setHitbox(28, 32, -2, 0);
			layer = 4;
			facingRight = FACINGRIGHT;
		}
		
		override public function update():void 
		{
			var prevY:Number = y;
			var prevX:Number = x;
			
			var halfYVel:Number = 0;
			
			//If we have not collided with terrain, apply gravity.
			if (!collide('Terrain',x,y))
			{
				if (velocity.y == 0 && hitPoints > 0)
				{
					x = Math.floor(x);
					
					var dirMod:int = (facingRight) ? -1 : 1;
										
					while (!collide('Terrain', x+dirMod, y))
					{
						x+=dirMod;
					}					
				}
								
				velocity.y += gravity;
				velocity.x = 0;
				
				if (velocity.y > 5)
				{
					velocity.y = 5;
				}
				
			}
			//If we're not applying gravity, and we're not moving, we should be.
			else if (velocity.x == 0)
			{
				if (velocity.y >= 5)
				{
					hitPoints = 0;
					causeOfDeath = falling;
				}
				velocity.y = 0;

				//Bump us up until we are only one pixel deep in the terrain.
				while (collide('Terrain', x, y - 1))
				{
					y--;
				}
				
				velocity.x = (facingRight) ? speed : -speed;
			}
					
			y += velocity.y;
			
			//Flag to see if our Derp could move.
			var movedToEmptySpace:Boolean = false;
			
			if (velocity.x != 0)
			{		
				for (var i:int = y; i > y - 5; i--)
				{
					//Check if our predicted position does not collide with terrain.
					if (!collide("Terrain", x + velocity.x, i))
					{
							//Set our y to the non collided space, then place us one pixel in the terrain.
							y -= y - i - 1;
							movedToEmptySpace = true;
							break;
					}
				}				
				
				//If we have not moved to an empty space we have hit a wall.
				if (!movedToEmptySpace)
				{
					velocity.x *= -1;
					facingRight = !facingRight;
				}
				else
				{
					//Martin
					//May want to consider moving this to an else below if (!movedToEmptySpace)
					//If the derp is in a space that will just fit his hitbox this will push him
					//into one of the walls. May want to wait for the next update to add velocity.
					if (hitPoints > 0) // If the derp is alive, then let it move
					{
						x += velocity.x;
					}
				}
			}
			
			
			if (velocity.y != 0) // falling
			{
				var haz:LayerHazards = collide('Hazard', x, y) as LayerHazards;
				if (haz != null)
				{
					hitPoints = 0;
					causeOfDeath = hazard;
				}
				
			}
			else if (velocity.x != 0)
			{
				var haz:LayerHazards = collide('Hazard', x, y-1) as LayerHazards;
				if (haz != null)
				{
					hitPoints = 0;
					causeOfDeath = hazard;
				}
			}
			
			
			
			
			
			sprite.flipped = !facingRight;
			
			super.update();
		}
		
		public function setPos(X:int, Y:int):void
		{
			x = X;
			y = Y;
		}
		
		public function resetVelocity():void
		{
			velocity.x = 0; velocity.y = 0;
		}
	}

}