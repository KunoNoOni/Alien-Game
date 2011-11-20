package
{
	import org.flixel.*;
	
	public class Asteroid extends FlxSprite
	{
		public function Asteroid()
		{
			super();
			loadGraphic(Registry._asteroid,false,false,32,32);
			exists = false;
		}

		public function launch():void
		{
			x = -32;
			y = 64 + (FlxG.random() * FlxG.height - 32);
			velocity.x = ((FlxG.random() * 100)+100);
			health = 4;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (x > FlxG.width)
			{
				exists = false;
			}
		}
	}
}