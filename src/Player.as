package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class Player extends FlxSprite
	{	
		private var myBulletBounds:FlxRect;
		
		public function Player(X:Number,Y:Number)
		{
			super(X,Y);
			loadGraphic(Registry._ship,false,false,32,32);
						
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
						
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT, 1, false, false);
			FlxControl.player1.setCursorControl(true, true, false, false);		
			FlxControl.player1.setMovementSpeed(0,100,0,100,0,0);
			facing = FlxObject.LEFT;
			myBulletBounds = new FlxRect(0,0,400, 300);
			Registry.wep = new FlxWeapon("lazer",this,"x","y");
			Registry.wep.makeImageBullet(50,Registry._bullet,-8,8);
			Registry.wep.setBulletDirection(FlxWeapon.BULLET_LEFT,200);
			Registry.wep.setBulletBounds(myBulletBounds);
			FlxControl.player1.setFireButton("Z",FlxControlHandler.KEYMODE_PRESSED,250,Registry.wep.fire);
			FlxControl.player1.setBounds(0,5,400,270);
		}
		
		override public function update():void
		{		
 			super.update();
			
			if(FlxG.keys.justReleased("Z"))
			{
				FlxG.play(Registry._lazer_fire);
			}
		}
	}
}