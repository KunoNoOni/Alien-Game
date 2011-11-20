package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			var logo:FlxText = new FlxText(FlxG.width*0.5-250,FlxG.height*0.5-25, 500, "Alien Game");
			logo.setFormat(null,40,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-250,FlxG.height*0.5+25, 500, "PRESS [x] TO START");
			instruct.setFormat(null,10,0xFF0000, "center");
			add(instruct);

		}
		
		override public function update():void
	  	{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());		
			super.update();
		}
	}
}