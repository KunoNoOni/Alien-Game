package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.utils.getTimer;

	public class AsteroidManager extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 500;
		
		public function AsteroidManager() 
		{
			super();
			
			for (var i:int = 0; i < 100; i++)
			{
				add(new Asteroid);
			}
		}
		
		public function release():void
		{
			var asteroid:Asteroid = Asteroid(getFirstAvailable());
			if (asteroid)
			{
				asteroid.launch();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
			
			if(Registry.distanceToEarth == 0)
			{
				setAll("exists",false);	
			}
		}
	}
}