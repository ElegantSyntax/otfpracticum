package Derps 
{
	import flash.geom.Point;
	import net.flashpunk.graphics.Spritemap;
	import Pointer;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsCrybaby extends DerpsBasic 
	{
		protected var isCrying:Boolean = false;
		protected var fixedPos:Point = new Point();
		
		public function DerpsCrybaby(X:int = 0, Y:int = 0, FACINGRIGHT:Boolean = true) 
		{
			sprite = new Spritemap(Assets.Crybabies, 32, 32);
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			super(X, Y, FACINGRIGHT);
			speed = 1.25;
			type = "Crybaby";
		}
		
		override public function update():void 
		{
			if (hitPoints > 0) 
			{
				super.update();
				var pntr:Pointer = collide("Pointer", x, y) as Pointer;
				if (pntr != null && pntr.pointerState == Pointer.click)
				{
					fixedPos.x = x;
					fixedPos.y = y;
					isCrying = !isCrying;
				}
				
				if (isCrying)
				{
					x = fixedPos.x;
					y = fixedPos.y;
					
					this.type = "Terrain";
					
					// check for collision against Bombers
				}
				else
				{
					this.type = "Crybaby";
				}
				
			}
			else
			{
				FP.world.remove(this);
			}
		}
		
	}
}