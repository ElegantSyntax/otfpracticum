package Derps 
{
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsRunner extends DerpsBasic 
	{
		
		public function DerpsRunner(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Runners, 32, 32);
			
			speed = 150;
			
			sprite.add("normal", [0]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
		}
		
		override public function update():void 
		{
			
			
			
			
			super.update();
		}
		
	}

}