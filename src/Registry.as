package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;

	public class Registry
	{
		public static var wep:FlxWeapon;
		public static var playerDead:Boolean = false;
		public static var distanceToEarth:int = 10000;
		public static var player:Player;
		public static var asteroids:AsteroidManager;
		public static var stars:FlxSprite;
		public static var starfield:StarfieldFX;
		public static var lives:Number;
		public static var GameOver:Boolean = true;
		public static var hud:HUD;
		public static var earth:Earth;
		public static var ReachedEarth:Boolean = false;

		[Embed(source = 'Sprites/asteroid.png')] static public var _asteroid:Class;
		[Embed(source = 'Sprites/bits.png')] static public var _bits:Class;
		[Embed(source = 'Sprites/bullet.png')] static public var _bullet:Class;
		[Embed(source = 'Sprites/earth.png')] static public var _earth:Class;
		[Embed(source = 'Sprites/ship.png')] static public var _ship:Class;
		[Embed(source = 'Sprites/numbers.png')] static public var _numbers:Class;
		[Embed(source = 'Sprites/hud.png')] static public var _hud:Class;
		
		//[Embed(source = 'Maps/.csv file', mimeType = 'application/octet-stream')] static public var _variable_name:Class;
		
		[Embed(source = 'sounds/asteroid_explosion.mp3')] static public var _asteroid_explosion:Class;
		[Embed(source = 'sounds/lazer_fire2.mp3')] static public var _lazer_fire:Class;
		[Embed(source = 'sounds/ship_explosion.mp3')] static public var _ship_explosion:Class;
		
		
		public function Registry()
		{
		}
		
		public static function init():void
		{
			player = new Player(340,158);
			asteroids = new AsteroidManager;
			hud = new HUD;
			earth = new Earth;
			
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(2, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 256);
			
			if(GameOver)
			{
				lives = 5;	
			}
		}
		
		public static function destroy():void
		{
			player = null;
			asteroids = null;
			starfield = null;
		}
		
	}
}