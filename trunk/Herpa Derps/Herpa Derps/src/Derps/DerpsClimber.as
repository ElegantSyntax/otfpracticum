package Derps 
{
	import Derps.DerpsAbility;
	import Derps.DerpsBasic;
	import Layers.LayerTerrain;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsClimber extends DerpsBasic 
	{
		private   var      ability:DerpsAbility = new DerpsAbility(DerpsAbility.Climber);
		private   var hasPassenger:Boolean = false;
		protected var    passenger:DerpsBasic;
		protected var       fixedX:int;
		
		public function DerpsClimber(X:int = 0, Y:int = 0, FACINGRIGHT:Boolean = true) 
		{
			sprite = new Spritemap(Assets.Climbers, 32, 32);
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			type = "Climber";
			
			super(X, Y, FACINGRIGHT);
			
			speed = 1.75;
		}
		
		override public function added():void 
		{
			super.added();
			FP.world.add(ability);
		}
		
		override public function update():void 
		{
			if (hitPoints > 0)
			{
				var terrain:LayerTerrain = null;
				
				if (!hasPassenger)
				{
					ability.updatePos(x, y, facingRight);
					terrain = ability.collide("Terrain", ability.x, ability.y) as LayerTerrain;
					
					if (terrain != null)
					{
						passenger = collide("Gelly", x, y) as DerpsBasic;
						x -= velocity.x;
						
						if (passenger != null)
						{
							trace("Passenger Connected");
							fixedX = (facingRight) ? x +3: x-3;
							y -= 10 ;//velocity.y + gravity*2;
							hasPassenger = true;
							passenger.isClimbing = true;
							isClimbing = true;
						}
					}
				}	
				else
				{
					ability.updatePos(fixedX, y+6, facingRight);
					terrain = ability.collide("Terrain", ability.x, ability.y) as LayerTerrain;
					
					if (terrain != null)
					{
						trace("Climbing");
						
						y -= velocity.y + gravity*2;
						x = fixedX;
						
						passenger.y = y;
						passenger.x = (facingRight) ? x - 20:x + 20;
						
						
					}
					else
					{
						y -= velocity.y + gravity*2;
						x = fixedX;
						
						passenger.y = y;
						passenger.x = (facingRight) ? x - 20:x - 10;
						
						hitPoints = 0;
						causeOfDeath = special;
						passenger.resetVelocity();
						
						trace("dead");
					}
				} 
				
				super.update();				
			}
			else if (causeOfDeath == special)
			{
				passenger.x = x;
				passenger.y = y;
				passenger.isClimbing = false;
				
				// Cool Death
				FP.world.remove(ability);
				FP.world.remove(this);
			}
			else
			{
				// Regular Death
				FP.world.remove(ability);
				FP.world.remove(this);
			}
			
		}
		
	}

}