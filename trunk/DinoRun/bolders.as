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
		
		var bolderPositiony:int = -192;
		
		var arrayofBolders:Array;
		
		var offSety:int = 64;

		var yLowerLimit:uint = 448; 
		public var speed:uint = 2;
		public var speedIncrease:uint = 4;
		static var count:int;
		
		
		public function bolders() 
		{
			var myLibraryGraphic:Class;
			//Get the class (specifically movieclip) from my lib fla.
			myLibraryGraphic = getDefinitionByName("bolders_mc") as Class;

			arrayofBolders  = new Array();
			count = 0;
			for (var lines:int; lines < 7; lines++)
			{	
				if (count == 0 || count == 2 || count == 4 || count == 6  )
				{
	
					var switchnumber:int = Math.floor(Math.random() * 3 );
					
					var bolder1:MovieClip;
					bolder1 = new  myLibraryGraphic() as MovieClip;
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
	
			addEventListener(Event.ENTER_FRAME, scrolling);

						
		}
		public function fullSPEED()
		{
				speed =speedIncrease;
		}
		
		/*************************************
		 * function that will change
		 * the bolders x position everytime
		 * it is lower then 448
		 * **********************************/
		
		public function changing(_bolder1:MovieClip, _bolder2:MovieClip)
		{
			var switchnumber:int = Math.floor(Math.random() * 6 );
			
			switch(switchnumber)
			{
				case 0:
				case 3:
					_bolder1.x = position1;
					_bolder2.x = position2;
					break;
				case 4:
				case 1:
					_bolder1.x = position2;
					_bolder2.x = position3;
					break;
				case 5:
				case 2:
					_bolder1.x = position3;
					_bolder2.x = position1;
					break;		
			}
	
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
			
			var switchnumber:int = Math.floor(Math.random() * 3 );

			if (arrayofBolders[0].y > yLowerLimit && arrayofBolders[1].y > yLowerLimit)
			{
				arrayofBolders[0].y = -64;
				arrayofBolders[1].y = -64;
				changing(arrayofBolders[0], arrayofBolders[1]);

			}

			if (arrayofBolders[2].y > yLowerLimit && arrayofBolders[3].y > yLowerLimit )
			{
				arrayofBolders[2].y = -64;
				arrayofBolders[3].y = -64;
				changing(arrayofBolders[2], arrayofBolders[3]);
			}
			
			if (arrayofBolders[4].y > yLowerLimit && arrayofBolders[5].y > yLowerLimit)
			{
				arrayofBolders[4].y = -64;
				arrayofBolders[5].y = -64;
				changing(arrayofBolders[4], arrayofBolders[5]);

			}
			if (arrayofBolders[6].y > yLowerLimit && arrayofBolders[7].y > yLowerLimit)
			{
				arrayofBolders[6].y = -64;
				arrayofBolders[7].y = -64;
				changing(arrayofBolders[6], arrayofBolders[7]);
				
			}
			
		}
		
	}//end of class
}//end of package