package  
{
	import flash.display.*;
	import flash.events.*;
	
	import flash.utils.getDefinitionByName;

	public class Dino extends MovieClip
	{
		public var dino:MovieClip;
		var position1:int = 0;
		var position2:int = 64;
		var position3:int = 128;
		
		var rightArrow:Boolean = false;
		var leftArrow:Boolean = false;
			
		public function Dino() 
		{
			addEventListener(Event.ENTER_FRAME, Initialize);
			
			
		}//end of function
		
		public function Initialize(e:Event)
		{
			var myLibraryGraphic:Class;
			myLibraryGraphic = getDefinitionByName("dino_mc") as Class;
			
			dino = new myLibraryGraphic() as MovieClip;
			
			dino.x = position2;
			dino.y = 384;
			
			addChild(dino);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUP);
			addEventListener(Event.ENTER_FRAME, Move);
			
			removeEventListener(Event.ENTER_FRAME, Initialize);
		}
		
		public function Move(event:Event)
		{
			if (rightArrow)
			{
				if (dino.x == position2)
				{	
					dino.x = position3;
				}
				else if (dino.x == position1)
				{
					dino.x = position1;
				}
			}
			if (leftArrow)
			{
				if (dino.x == position2)
				{	
					dino.x = position1;
				}
				else if (dino.x == position3)
				{
					dino.x = position2;
				}
			}
		
		}
		public function keyDown(event:KeyboardEvent)
		{
			trace("Rightarrow" + rightArrow);
			trace("Leftarrow" + leftArrow);
			
			//right
			if (event.keyCode == 39)
			{		
				rightArrow = true;
			}
			//left
			if (event.keyCode == 37)
			{
				leftArrow = true;	
			}
			
		}
		public function keyUP(event:KeyboardEvent)
		{
			//right
			if (event.keyCode == 39)
			{
				rightArrow = false;
			}
			//left
			if (event.keyCode == 37)
			{
				leftArrow = false;
			}
			
		}

	}//end of class

}//end of package