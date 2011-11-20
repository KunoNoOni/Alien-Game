package
{
	import org.flixel.*;
	
	public class Earth extends FlxSprite
	{
		public function Earth()
		{
			super();
			loadGraphic(Registry._earth,false,false,122,122);
			x = -122;
			y = FlxG.height*0.5-75;
		}

		override public function update():void
		{
			super.update();
		}
	}
}