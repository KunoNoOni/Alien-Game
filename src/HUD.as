package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class HUD extends FlxGroup
	{
		private var panel:FlxSprite;
		private var miles:FlxBitmapFont;
		private var lives:FlxBitmapFont;
		
		public var liveUpdate:Boolean;

		public function HUD() 
		{
			super();
			
			panel = new FlxSprite(0, 0, Registry._hud);
			FlxDisplay.screenCenter(panel, true);
			
			miles = new FlxBitmapFont(Registry._numbers, 7, 8, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ:", 10, 1);
			miles.setText("MILES TO EARTH:"+Registry.distanceToEarth.toString(), false, 1, 0, FlxBitmapFont.ALIGN_CENTER);
			miles.x = panel.x + 11;
			miles.y = 8;
			
			lives = new FlxBitmapFont(Registry._numbers, 7, 8, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ:", 10, 1);
			lives.setText("LIVES:"+Registry.lives.toString(), false);
			lives.x = panel.x + 175;
			lives.y = 8;
			
			setAll("scrollFactor.x", 0, true);
			setAll("scrollFactor.y",0,true)
			
			liveUpdate = true;
			
			add(panel);
			add(miles);
			add(lives);
		}
		
		override public function update():void
		{
			super.update();
			
			if (liveUpdate)
			{
				miles.text = "MILES TO EARTH:"+Registry.distanceToEarth.toString();
				lives.text = "LIVES:"+Registry.lives.toString();
			}
		}
	}
}