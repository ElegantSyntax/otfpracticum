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
		
		public function DerpsRunner(X:int = 0, Y:int = 0, FACINGRIGHT:Boolean = true) 
		{
			sprite = new Spritemap(Assets.Runners, 32, 32);
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y, FACINGRIGHT);
			type = "Runner";
			
			speed = 2.0;
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
							terrain.removeRect(x - 7, y - 2, 36, 34); // I think the 7 should really be a 5...
							x += 20;
							break;
					}
					
					hitPoints -= 4
					
					if (hitPoints <= 0)
					{
						causeOfDeath = special;
					}
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
			
			
			super.update();
		}
		
	}

}