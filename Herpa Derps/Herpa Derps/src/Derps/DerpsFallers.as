package Derps 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import Layers.LayerTerrain;
	import flash.display.BlendMode;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsFallers extends DerpsBasic 
	{
		
		public function DerpsFallers(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Fallers, 32, 32);
			
			sprite.add("normal", [0]);
			sprite.add("dead", [1]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
		}
		
		override public function update():void 
		{
			if (hitPoints > 0)
			{
				super.update();
			}
			else if (causeOfDeath == falling)
			{				
				sprite.play("dead");
				
				var terrains:Array = new Array();
				FP.world.getType("Terrain", terrains);
				
				for each (var terrain:LayerTerrain in terrains)
				{
					if (terrain.isDestructable)
					{
						sprite.blend = BlendMode.MULTIPLY;
						// Draw the sprite to the destructable terrain layer
						
						terrain.updateMask();
						FP.world.remove(this);
						
						return;
					}
				}
				
				
			}
			else
			{
				FP.world.remove(this);
				// Plain Death
			}
		}
		
	}

}