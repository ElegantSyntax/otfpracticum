package  
{
	import flash.display.*;
	import flash.events.*;

	public class Bolders extends MovieClip
	{	
		
		var position1:uint = 0;
		var position2:uint = 64;
		var position3:uint = 128;
		
		static var bolderPositiony:int = 0;
		
		var arrayofBolders:Array;
		
		var offSety:int = 64;
		
		
		//var bolder1:bolders_mc = new bolders_mc();
		//var bolder2:bolders_mc = new bolders_mc();
	

		var yLowerLimit:uint = 448; 
		var speed:uint = 3;
		static var count:int = 0;

		
		public function bolders() 
		{
			arrayofBolders  = new Array();
			
			for (var lines:int; lines < 7; lines++)
			{	
				if (count == 0 || count == 2 || count == 4 || count == 6 )
				{
					var switchnumber:int = Math.floor(Math.random() * 3 );
					var bolder1:bolders_mc = new bolders_mc();
					var bolder2:bolders_mc = new bolders_mc();
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
					//bolderPositiony +=offSety;
					//bolderPositiony+= offSety;
					
				}//end of if
				else if( count == 1|| count == 3|| count == 5)
				{
					bolderPositiony +=offSety;
					bolderPositiony+= offSety;
					
				}
				count ++;
			}
			trace(arrayofBolders.length);
			for ( var number:uint; number < arrayofBolders.length; number++)
			{			
				addChild(arrayofBolders[number]);

			}

			addEventListener(Event.ENTER_FRAME,scrolling);
			
		}
		public function scrolling(event:Event)
		{

	//		bolder1.y +=speed;
	//		bolder2.y +=speed;
	for ( var movingNumber:int; movingNumber < arrayofBolders.length; movingNumber)
	{
		arrayofBolders[movingNumber].y += speed;
		
	}
			
	//		if(bolder1.y > yLowerLimit)
	//		{
	//			bolder1.y = -yLowerLimit;
	//		}
	//		if(bolder2.y > yLowerLimit)
	//		{
	//			bolder2.y = -yLowerLimit;
	//		}
		
		}
		
	}//end of class
}//end of package