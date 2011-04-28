package  
{
	import flash.display.*;
	import flash.events.*;	
	
	public class theGame extends MovieClip
	{
		var Bolders:bolders = new bolders();
		var background:Background = new Background();
		var dino:Dino = new Dino();

		public function theGame() 
		{
			
			addChild(Bolders);
			addChild(background);
			addChild(dino);
			//set the bolders at the top of the background.
			setChildIndex(Bolders, 1);
			setChildIndex(dino, 2);

		}

		
	}

}