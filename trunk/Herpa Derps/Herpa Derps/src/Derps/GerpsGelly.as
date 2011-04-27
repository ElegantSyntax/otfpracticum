package Derps 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import Layers.LayerTerrain;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import Layers.LayerTerrain;
	import flash.display.BlendMode;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Joseph O'Connor
	 */
	public class GerpsGelly extends DerpsBasic 
	{
		
		public function GerpsGelly(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Gellies, 32, 32);
			
			sprite.add("normal", [0]);
			sprite.add("stretched", [1]);
			sprite.add("dead", [2]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
			
			//speed = 90;
		}
		
		override public function update():void 
		{
			if (hitPoints > 0)
			{
				super.update();
			}
			else if (causeOfDeath == hazard)
			{
				sprite.play("dead");
				
				var dirMod:int = (facingRight) ? 1 : -1;
				x = int(32 * Math.round(x / 32)) + (24 * (dirMod)) - dirMod;
				y -= 1;
				
				var terrains:Array = new Array();
				FP.world.getType("Terrain", terrains);
				
				for each (var terrain:LayerTerrain in terrains)
				{
					if (!terrain.isDestructable)
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
				// Regular Death
				FP.world.remove(this);
			}
			
			
			
		}
		
	}

}