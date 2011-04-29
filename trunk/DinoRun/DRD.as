package  
{
	import flash.display.*;
	import flash.events.*;

	public class DRD extends MovieClip
	{
		public var startbtn:SimpleButton;
		
		
		public function DRD() 
		{		
			startbtn.addEventListener(MouseEvent.CLICK, playGame);
			
		}
		
		public function playGame(event:MouseEvent)
		{
			gotoAndStop("play");
		}
		
	}

}