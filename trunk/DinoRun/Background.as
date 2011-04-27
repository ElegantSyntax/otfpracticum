package  
{
	import flash.display.*;
	import flash.events.*;
	
	public class Background extends MovieClip
	{
		var bg_1:bg_mc = new bg_mc();
		var bg_2:bg_mc = new bg_mc();

		var yLowerLimit:uint = 448; 
		var speed:uint = 3;

	
		public function Background() 
		{
			bg_1.x =bg_1.width/2;
			bg_1.y = 0;

			bg_2.x = bg_1.width/2;
			bg_2.y = -448;


			addChild(bg_1);
			addChild(bg_2);

			addEventListener(Event.ENTER_FRAME,movingBG);
					
		}
		private function movingBG(event:Event)
		{

			bg_1.y +=speed;
			bg_2.y +=speed;
			
			
			if(bg_1.y > yLowerLimit)
			{
				bg_1.y = -yLowerLimit;
			}
			if(bg_2.y > yLowerLimit)
			{
				bg_2.y = -yLowerLimit;
			}
		
		
		}//end of moving function
	}

	}//end of package