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
						//sprite.blend = BlendMode.MULTIPLY;
						// Draw the sprite to the destructable terrain layer
						
						var bmd:BitmapData = new BitmapData(terrain.terrainImage.width, terrain.terrainImage.height, true, 0);
						terrain.graphic.render(bmd, FP.camera, FP.camera);
						
						var bmds:BitmapData = new BitmapData(32, 32, true, 0);
						sprite.render(bmds, FP.camera, FP.camera);
						
						bmd.copyPixels(bmds, new Rectangle(0, 0, 32, 32), new Point(x, y));
						
						terrain.terrainImage = new Image(bmd);
						terrain.mask = new Pixelmask(bmd);
						
						//terrain.updateMask();
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