package  
{
	import flash.display.*;
	import flash.events.*;

	public class DRD extends MovieClip
	{
		public var startbtn:SimpleButton;
		
		public function DRD() 
		{
			trace("blahbalhblh");
			
			stop();
			
			startbtn.addEventListener(MouseEvent.CLICK,playGame);
			
			//addChild(Bolders);
			//addChild(background);
			//set the bolders at the top of the background.
			//setChildIndex(Bolders, 1);
		
		}
		
		public function playGame(event:MouseEvent)
		{
			gotoAndStop("play");
		}
		
	}

}