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
			super(800, 480, 60, true);
		}

		override public function init():void 
		{
			FP.console.enable();
			FP.world = new Level("TestLevel");
			
			super.init();
		}
		override public function update():void 
		{
			super.update();
		}

	}

}