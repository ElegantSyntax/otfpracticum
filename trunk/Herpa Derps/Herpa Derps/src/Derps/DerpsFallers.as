package Derps 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import Layers.LayerTerrain;
	import flash.display.BlendMode;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class DerpsFallers extends DerpsBasic 
	{
		
		public function DerpsFallers(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Fallers, 32, 32);
			
			sprite.add("normal", [0]);
			sprite.add("dead", [1]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
		}
		
		override public function update():void 
		{
			if (hitPoints > 0)
			{
				super.update();
			}
			else if (causeOfDeath == falling)
			{				
				sprite.play("dead");
				
				var terrains:Array = new Array();
				FP.world.getType("Terrain", terrains);
				
				for each (var terrain:LayerTerrain in terrains)
				{
					if (terrain.isDestructable)
					{
						// Draw the sprite to the destructable terrain layer
						
						// Capture the terrain's BitmapData
						var bmd:BitmapData = new BitmapData(terrain.terrainImage.width, terrain.terrainImage.height, true, 0);
						terrain.graphic.render(bmd, FP.camera, FP.camera);
						
						// Capture the sprite's BitmapData
						var corpsebmd:BitmapData = new BitmapData(32, 32, true, 0);
						sprite.render(corpsebmd, FP.camera, FP.camera);
						
						// Copy the sprite to the terrian
						bmd.copyPixels(corpsebmd, new Rectangle(0, 0, 32, 32), new Point(x, y), corpsebmd, new Point(0, 0), false);
						
						// Reset the terrains image and graphic
						terrain.terrainImage = new Image(bmd);
						terrain.graphic = terrain.terrainImage;
						
						// Update the mask
						terrain.mask = new Pixelmask(bmd);
						
						// Remove the corpse from the world
						FP.world.remove(this);
						
						return;
					}
				}
				
				
			}
			else
			{
				FP.world.remove(this);
				// Plain Death
			}
		}
		
	}

}