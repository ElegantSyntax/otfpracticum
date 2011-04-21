package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Martin Copp
	 */
	public class Game extends World 
	{
		
		public static var curLevel:Level;
		
		public function Game() 
		{
			curLevel = new Level();
			
			add(curLevel); //add our level with tiles
			var p:Player = new Player; //add our player
				p.x = 320;
				p.y = 50;
			add(p);
		}
		
	}

}