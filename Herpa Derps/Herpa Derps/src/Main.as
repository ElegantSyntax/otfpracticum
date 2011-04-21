package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{
		
		
		public function Main():void 
		{
			super(800, 480);
		}

		override public function init():void 
		{
			FP.console.enable();
			FP.world = new Level(1600, 480);
			
			super.init();
		}

	}

}