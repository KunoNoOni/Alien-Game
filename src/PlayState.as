package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class PlayState extends FlxState
	{
		private var counter:Number = 0;
		private var emitter:FlxEmitter;

		override public function create():void
		{	
			Registry.init();
			Registry.GameOver = false;

			add(Registry.stars);
			add(Registry.asteroids);
			add(Registry.wep.group);
			add(Registry.player);
			add(Registry.hud);
			add(Registry.earth);
			
			Registry.hud.setAll("scrollFactor",new FlxPoint(0,0));
			Registry.hud.setAll("cameras", [FlxG.camera]);
		}

		override public function update():void
		{
			if(Registry.playerDead)
			{
				counter += FlxG.elapsed;
				if(counter >=1)
				{
					resetWave();
				}
			}
			
			if(Registry.distanceToEarth == 0)
			{
				Registry.earth.velocity.x = 25;
			}
			else
			{
				--Registry.distanceToEarth;
			}
			
			super.update();
			
			FlxG.collide(Registry.player,Registry.asteroids,playerDie);
			FlxG.collide(Registry.wep.group,Registry.asteroids,asteroidExplode);
			FlxG.collide(Registry.player,Registry.earth,madeIt);
			
		}
		
		override public function destroy():void
		{
			FlxSpecialFX.clear();
			Registry.hud.liveUpdate = false;
			Registry.destroy();
			
			super.destroy();
		}
		
		private function madeIt(p:FlxSprite, e:FlxSprite):void
		{
			Registry.asteroids.setAll("exists",false);
			Registry.earth.velocity.x = 0;
			Registry.ReachedEarth = true;
			FlxG.switchState(new GameOverState());
		}
		
		private function playerDie(p:FlxSprite, e:FlxSprite):void
		{
			if(!Registry.playerDead)
			{			
				Registry.lives -= 1;
				p.kill();
				Registry.playerDead = true;
				FlxG.play(Registry._ship_explosion);
				FlxG.shake(.02,.5);
				emitter = new FlxEmitter(p.x,p.y);
				emitter.makeParticles(Pixel,20,0,true);
				add(emitter);
				emitter.start();
			}
		}
		
		private function asteroidExplode(b:FlxSprite, e:FlxSprite):void
		{
			b.kill();
			e.kill();
			FlxG.play(Registry._asteroid_explosion);
			emitter = new FlxEmitter(e.x,e.y);
			emitter.makeParticles(Registry._bits,10,0,true);
			add(emitter);
			emitter.start(true,3);
		}
		
		private function resetWave():void
		{	
			if(Registry.lives < 0)
			{
				FlxG.switchState(new GameOverState());
			}
			else if(Registry.playerDead)
			{
				Registry.playerDead = false;
				FlxG.resetState();
			}
		}
	}
}
