package  
{
	import flash.display.*;
	import flash.events.*;	
	import flash.text.*;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	public class theGame extends MovieClip
	{
		
		var Bolders:bolders = new bolders();
		var background:Background = new Background();
		var dino:Dino = new Dino();
		
		//TEXT
		var scoreText:TextField;
		//TIME
		var startTime:uint;
		var time:uint;

		public function theGame() 
		{
			//set the text format
			var tFormat:TextFormat = new TextFormat();
			tFormat.font = "Berlin Sans FB Demi";
			tFormat.size = 16;
			tFormat.bold = true;
			
			//add things on the stage
			addChild(Bolders);
			addChild(background);
			addChild(dino);
			
			//set the text field
			scoreText = new TextField();
			scoreText.defaultTextFormat = tFormat;
			scoreText.x = 10;
			scoreText.y = 10;
			//add it on the stage
			addChild(scoreText);
			//start time
			startTime = getTimer();
			time = 0;
			//set the layers
			setChildIndex(Bolders, 1);
			setChildIndex(dino, 2);
			setChildIndex(scoreText, 3);

			addEventListener(Event.ENTER_FRAME, showTime);
		
		}

		public function showTime(event:Event)
		{
			time = getTimer() - startTime;
			
			scoreText.text = "Time: "+clockTime(time);
			
		}
		public function clockTime(ms:int)
		{
			var seconds:int = Math.floor(ms/1000);
			var minutes:int = Math.floor(seconds/60);
			seconds -= minutes*60;
			var timeString:String = minutes+":"+String(seconds+100).substr(1,2);
			return timeString;
		}

		
	}

}