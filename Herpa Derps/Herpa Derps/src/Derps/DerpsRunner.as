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
	public class DerpsRunner extends DerpsBasic 
	{
		
		private var ability:DerpsAbility = new DerpsAbility(DerpsAbility.Runner);
		
		public function DerpsRunner(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Runners, 32, 32);
			
			speed = 150;
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
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
				ability.updatePos(x,y,facingRight);
			
				var terrain:LayerTerrain;
				terrain = ability.collide("Terrain", ability.x, ability.y) as LayerTerrain;
				if (terrain != null && terrain.isDestructable)
				{
					switch(facingRight)
					{
						case true:
							terrain.removeRect(x + 5, y - 2, 36, 34);
							x -= 20;
							break;
						case false:
							terrain.removeRect(x - 5, y - 2, 36, 34);
							x += 20;
							break;
					}
					
					hitPoints -= 4
					
					if (hitPoints <= 0)
					{
						causeOfDeath = DerpsBasic.ability;
					}
				}
			}
			else if (causeOfDeath == DerpsBasic.ability)
			{
				// Cool Death
				FP.world.remove(ability);
				FP.world.remove(this);
			}
			else if (causeOfDeath == DerpsBasic.hazard)
			{
				// Hazard Death
				FP.world.remove(ability);
				FP.world.remove(this);
			}
			else
			{
				// Regular Death
				FP.world.remove(ability);
				FP.world.remove(this);
			}
			
			
			super.update();
		}
		
	}

}