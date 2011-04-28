package src
{
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	import com.greensock.TweenMax;
	import com.gskinner.utils.*;

	
	/**
	 * ...
	 * @author Martin Copp
	 */
	public class Main extends MovieClip
	{
		
		public var dude:MovieClip;
		
		public function Main():void 
		{
			TweenMax.to(dude, 2.0, { x:100 } );
			TweenMax.to(dude, 3.0, { y:50, onComplete:FirstThing, delay:1.0, ease:Linear.easeInOut});		
		}
		
		public function FirstThing():void
		{
			TweenMax.to(dude, 3.0, { x:300, y:300, ease:Elastic.easeInOut, onComplete:Shake});
		}
		
		public function Shake():void
		{
			TweenMax.to(dude, 0.01, { x:dude.x + (Rndm.integer(-6, 6) * 5), repeat:-1, yoyo:true, ease:Linear.easeNone} );
		}
	}
}