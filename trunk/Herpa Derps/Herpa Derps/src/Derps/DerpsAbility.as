package Derps 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsAbility extends Entity 
	{
		public static const    Runner:int = 0;
		public static const   Climber:int = 0;
		
		public function DerpsAbility(TYPE:int) 
		{
			switch (TYPE)
			{
				case Runner:
					type = "RunnerAbility";
					break;
				case Climber:
					type = "ClimberAbility";
					break;
			}
			
			setHitbox(6, 27);
		}
		
		public function updatePos(xPos:int, yPos:int, facingRight:Boolean):void 
		{
			y = yPos;
			
			switch (facingRight)
			{
				case true:
					x = xPos + 32;
					break;
				case false:
					x = xPos - 6; // this should be 4 I think.
					break;
			}
			
			super.update();
		}
	}

}