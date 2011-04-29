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
		var endGameText:TextField;
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
			
			//end game text
			endGameText = new TextField();
			endGameText.x = 50;
			endGameText.y = 200;
			endGameText.defaultTextFormat = tFormat;
			
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
			addEventListener(Event.ENTER_FRAME, collisionCheck);
			addEventListener(Event.ENTER_FRAME, fullSPEED);
		
		}
		public function fullSPEED(event:Event)
		{
			//trace("time " +time);
			if (time == 4000)
			{
				background.fullSPEED();
				Bolders.fullSPEED();	
			}
		}
		public function collisionCheck(event:Event)
		{
			for (var numberOfBolders:int = Bolders.arrayofBolders.length - 1 ; numberOfBolders >= 0; numberOfBolders--)
			{
				if (Bolders.arrayofBolders[numberOfBolders].hitTestObject(dino))
				{
						removeChild(dino);
						removeChild(Bolders);
						removeChild(background);
					
						
						removeEventListener(Event.ENTER_FRAME, collisionCheck);
						removeEventListener(Event.ENTER_FRAME, showTime);
						gotoAndStop("gameover");
						endGameText.text = " GAME OVER";
						addChild(endGameText);
				}

			}
			
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