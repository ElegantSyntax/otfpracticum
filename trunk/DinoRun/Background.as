package  
{
	import authoring.authObject;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;
	
	public class Background extends MovieClip
	{
		var bg_1:MovieClip;
		var bg_2:MovieClip;

		var yLowerLimit:uint = 448; 
		public var speed:uint;

	
		public function Background() 
		{
			var myLibraryGraphic:Class;
			speed = 2;
			//Get the class (specifically movieclip) from my lib fla.
			myLibraryGraphic = getDefinitionByName("bg_mc") as Class;
			
			//Create the new movieclips.
			bg_1 = new myLibraryGraphic() as MovieClip;
			bg_2 = new myLibraryGraphic() as MovieClip;
			
			bg_1.x =bg_1.width/2;
			bg_1.y = 0;

			bg_2.x = bg_1.width/2;
			bg_2.y = -448;


			addChild(bg_1);
			addChild(bg_2);

			addEventListener(Event.ENTER_FRAME, movingBG);
								
		}
		public function fullSPEED()
		{
			speed =6;
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
	}//end class

}//end of package