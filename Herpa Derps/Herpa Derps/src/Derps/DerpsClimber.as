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
		
		public function DerpsClimber(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Climbers, 32, 32);
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			type = "Climber";
			
			super(X, Y);
			
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
							fixedX = x;
							y -= velocity.y + gravity*2;
							hasPassenger = true;
							passenger.isClimbing = true;
							isClimbing = true;
						}
					}
				}	
				else
				{
					trace("Climbing");
					
					y -= velocity.y + gravity*2;
					
					passenger.y = y;
					passenger.x = (facingRight) ? x - 20:x + 20;
					
					if (fixedX != x)
					{
						hitPoints = 0;
						causeOfDeath = special;
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