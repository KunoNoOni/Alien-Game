package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;

	public class GameOverState extends FlxState
	{
		private var starfield:StarfieldFX;
		private var stars:FlxSprite;
		private var gameOver:FlxText;
		private var playAgain:FlxButtonPlus;
		
		public function GameOverState() 
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			if(!Registry.ReachedEarth)
			{
				starfield = FlxSpecialFX.starfield();
				starfield.setStarSpeed(2, 0);
				stars = starfield.create(0, 0, FlxG.width, FlxG.height, 256,0);
			
				gameOver = new FlxText(0, 48, 400, "GAME OVER");
				gameOver.alignment = "center";
				gameOver.size = 60;
				gameOver.alpha = 0.7;
				gameOver.color = 0xFF0080;
			
				playAgain = new FlxButtonPlus(0, 208, startGame, null, "Start Over");
				playAgain.screenCenter();
			
				add(stars);
				add(gameOver);
				add(playAgain);
			
				FlxG.mouse.show();
			}
			else
			{
				starfield = FlxSpecialFX.starfield();
				starfield.setStarSpeed(2, 0);
				stars = starfield.create(0, 0, FlxG.width, FlxG.height, 256,0);
				
				gameOver = new FlxText(0, 10, 400, "You have finally reached Earth. Scanning the planet you\ndiscover a rare metal called gold. There is also life on the planet, life you can\nmanipulate into mining the gold for you! Go forth and become GODS!");
				gameOver.alignment = "center";
				gameOver.size = 20;
				gameOver.alpha = 0.7;
				gameOver.color = 0x00FF00;
				
				playAgain = new FlxButtonPlus(0, 230, startGame, null, "Start Over");
				playAgain.screenCenter();
				
				add(stars);
				add(gameOver);
				add(playAgain);
				
				FlxG.mouse.show();
			}
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			
			Registry.GameOver = true;
			Registry.ReachedEarth = false;
			Registry.playerDead = false;
			Registry.destroy();
			Registry.distanceToEarth = 10000;
			FlxG.switchState(new PlayState());
		}
		
		override public function destroy():void
		{
			FlxSpecialFX.clear();
			super.destroy();
		}
	}
}