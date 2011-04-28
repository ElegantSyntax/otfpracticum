package  
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;

	public class bolders extends MovieClip
	{	
		
		var position1:uint = 0;
		var position2:uint = 64;
		var position3:uint = 128;
		
		static var bolderPositiony:int = 0;
		
		var arrayofBolders:Array;
		
		var offSety:int = 64;

		var yLowerLimit:uint = 448; 
		var speed:uint = 2;
		static var count:int = 0;

		
		public function bolders() 
		{
			var myLibraryGraphic:Class;
			
			//Get the class (specifically movieclip) from my lib fla.
			myLibraryGraphic = getDefinitionByName("bolders_mc") as Class;
					
			arrayofBolders  = new Array();
			
			for (var lines:int; lines < 7; lines++)
			{	
				if (count == 0 || count == 2 || count == 4 || count == 6 )
				{
	
					var switchnumber:int = Math.floor(Math.random() * 3 );
					
					var bolder1:MovieClip;
					bolder1 = new myLibraryGraphic() as MovieClip;
					var bolder2:MovieClip ;
					bolder2 = new myLibraryGraphic() as MovieClip;
					
					bolder1.y = bolderPositiony;
					bolder2.y = bolderPositiony;
					switch(switchnumber)
					{
						case 0:
							bolder1.x = position1;
							bolder2.x = position2;
							break;
						case 1:
							bolder1.x = position2;
							bolder2.x = position3;
							break;
							
						case 2:
							bolder1.x = position3;
							bolder2.x = position1;
							break;		
					}
					arrayofBolders.push(bolder1);
					arrayofBolders.push(bolder2);
					
				}//end of if
				else if( count == 1|| count == 3|| count == 5)
				{
					bolderPositiony +=offSety;
					bolderPositiony += offSety;
					
				}
				count ++;
			}
			for ( var number:uint; number < arrayofBolders.length; number++)
			{			
				addChild(arrayofBolders[number]);

			}
	
			addEventListener(Event.ENTER_FRAME,scrolling);
			
		}
		public function scrolling(event:Event)
		{

			arrayofBolders[0].y += speed;
			arrayofBolders[1].y += speed; 
			arrayofBolders[2].y += speed;
			arrayofBolders[3].y += speed;
			arrayofBolders[4].y += speed;
			arrayofBolders[5].y += speed;
			arrayofBolders[6].y += speed;
			arrayofBolders[7].y += speed;

			if (arrayofBolders[0].y > yLowerLimit)
			{
				arrayofBolders[0].y = -64;
			}
			if (arrayofBolders[1].y > yLowerLimit)
			{
				arrayofBolders[1].y = -64;
			}
			if (arrayofBolders[2].y > yLowerLimit)
			{
				arrayofBolders[2].y = -64;
			}
			if (arrayofBolders[3].y > yLowerLimit)
			{
				arrayofBolders[3].y = -64;
			}
			if (arrayofBolders[4].y > yLowerLimit)
			{
				arrayofBolders[4].y = -64;
			}
			if (arrayofBolders[5].y > yLowerLimit)
			{
				arrayofBolders[5].y = -64;
			}
			if (arrayofBolders[6].y > yLowerLimit)
			{
				arrayofBolders[6].y = -64;
			}
			if (arrayofBolders[7].y > yLowerLimit)
			{
				arrayofBolders[7].y = -64;
			}
			
		}
		
	}//end of class
}//end of package