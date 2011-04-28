package Derps 
{
	import Derps.DerpsAbility;
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
		private var ability:DerpsAbility = new DerpsAbility(DerpsAbility.Climber);
		
		public function DerpsClimber(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Climbers, 32, 32);
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			type = "Climber";
			
			super(X, Y);
			
			speed = 105;
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
				ability.updatePos(x, y, facingRight);
				
				var terrain:LayerTerrain;
				terrain = ability.collide("Terrain", ability.x, ability.y) as LayerTerrain;
				if (terrain != null)
				{
					
				}
				else
				{
					super.update();
				}
				
				
				
			}
			else if (causeOfDeath == special)
			{
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