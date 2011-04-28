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
		var speed:uint = 2;

	
		public function Background() 
		{
			var myLibraryGraphic:Class;
			
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
			addEventListener(Event.ENTER_FRAME, fullSPEED);
					
		}
		public function fullSPEED(event:Event)
		{

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