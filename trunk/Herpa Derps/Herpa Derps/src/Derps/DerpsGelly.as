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
	public class DerpsGelly extends DerpsBasic 
	{
		
		public function DerpsGelly(X:int = 0, Y:int = 0) 
		{
			sprite = new Spritemap(Assets.Gellies, 32, 32);
			
			sprite.add("normal", [0]);
			sprite.add("stretched", [1]);
			sprite.add("dead", [2]);
			
			sprite.play("normal");
			graphic = sprite;
			
			super(X, Y);
			
			type = "Gelly";
			
			speed = 1.0;
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
				
				if (!collide('Hazard', x, y - 32) )
				{
					// Falling
					sprite.centerOrigin();
					sprite.angle = 90 * -dirMod;
					x = int(16 * Math.round(x / 16));// + (24 * (dirMod)) - dirMod;
					y = int(16 * Math.round(y / 16))+16 ;
				}
				else
				{
					x = int(16 * Math.round(x / 16)) + (16*dirMod);
					y = int(16 * Math.round(y / 16));
				}
				
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
						bmd.copyPixels(corpsebmd, new Rectangle(0, 0, 32, 32), new Point(x, y), corpsebmd, new Point(0, 0), true);
						
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