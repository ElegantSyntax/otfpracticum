package  
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;


	public class DRD extends MovieClip
	{
		public var startbtn:SimpleButton;
		public var endbtn:SimpleButton;
		public var TimeTxt:TextField;
		
		public function DRD() 
		{	
			startbtn.addEventListener(MouseEvent.CLICK, playGame);	
			//endbtn.addEventListener(MouseEvent.CLICK, playAgain);
		}
		
		public function playGame(event:MouseEvent)
		{
			gotoAndStop("play");
		}	
		public function playAgain(event:MouseEvent)
		{
			removeChild(TimeTxt);
			gotoAndStop("play");
		}
		public function displayTEXT()
		{
			addChild(TimeTxt);
		}
	}

}