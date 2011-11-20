package
{
	import org.flixel.*;
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	
	public class AlienGame extends FlxGame
	{
		public function AlienGame()
		{
			super(400,300,MenuState,2);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}