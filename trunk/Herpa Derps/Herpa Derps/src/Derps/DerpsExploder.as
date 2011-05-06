package Derps 
{
	import Layers.LayerTerrain;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsExploder extends DerpsBasic 
	{
		public var detonate:Boolean = false;
		
		public function DerpsExploder(X:int = 0, Y:int = 0, FACINGRIGHT:Boolean = true) 
		{
			sprite = new Spritemap(Assets.Exploders, 32, 32);
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			super(X, Y, FACINGRIGHT);
			speed = 1.25;
			type = "Exploder";
		}
		
		override public function update():void 
		{
			super.update();
			
			if (detonate)
			{
				var terrain:LayerTerrain;
				terrain = collide("Terrain", x, y) as LayerTerrain;
				if (terrain != null && terrain.isDestructable)
				{
					terrain.removeCircle(x + 15, y+10, 30);
					FP.world.remove(this);
				}
			}
		}
		
	}

}