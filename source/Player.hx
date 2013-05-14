package ;
import haxe.Timer;
import nme.display.Graphics;
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxTimer;
import common.Colors;

/**
 * ...
 * @author Masadow
 */
class Player extends FlxSprite
{

	public var colorAffector : UInt;
	private var blink : FlxTimer;
	private var hidden : Bool;
	
	public function new(x : Int, y : Int)
	{
		super(x, y);
		makeGraphic(16, 16, Colors.PLAYER, true, "player");
		colorAffector = Colors.BASIC;
		blink = null;
		hidden = false;
	}
	
	private function blinkOn(t : FlxTimer)
	{
		makeGraphic(16, 16, 0x0, true, "hideplayer");
		if (blink != null)
			blink.destroy();
		blink = new FlxTimer();
		blink.start(.5, 1, blinkOff);
	}
	
	private function blinkOff(t : FlxTimer)
	{
		makeGraphic(16, 16, Colors.PLAYER, true, "player");
		hidden = false;
		if (blink != null)
			blink.destroy();
		blink = null;
		if (colorAffector == Colors.BLINKING)
		{
			blink = new FlxTimer();
			blink.start(.5, 1, blinkOn);
		}
	}
	
	override private function calcFrame():Void 
	{
		super.calcFrame();
		if (hidden)
		{
			var gfx : Graphics = FlxG.flashGfx;
			gfx.clear();
			gfx.beginFill(0x0);
			var radius = frameWidth / 2;
			gfx.drawCircle(radius, radius, radius);
			gfx.endFill();
			framePixels.draw(FlxG.flashGfxSprite);
		}
	}

	public override function update()
	{
		super.update();
		if (colorAffector == Colors.BLINKING && blink == null)
			blinkOn(blink);
		if (colorAffector == Colors.HIDE && !hidden)
		{
			hidden = true;
			makeGraphic(16, 16, 0x0, true, "hideplayer");
			calcFrame();
		}
		else if (colorAffector != Colors.HIDE && hidden)
		{
			hidden = false;
			makeGraphic(16, 16, Colors.PLAYER, true, "player");
		}
		//Check if not automoving
		if (path == null)
		{
			if (colorAffector == Colors.SMOOTH)
			{
				velocity.x *= .8;
				velocity.y *= .8;
			}
			else
			{
				velocity.x *= .5;
				velocity.y *= .5;
			}
			var speed = colorAffector == Colors.FREEZE ? 50 : colorAffector == Colors.FAST ? 400 : 200;
			if (FlxG.keys.A || FlxG.keys.LEFT)
			{
				if (colorAffector == Colors.ROTATE_CMD)
					velocity.y = speed;
				else
					velocity.x = -speed;
			}
			if (FlxG.keys.S || FlxG.keys.DOWN)
			{
				if (colorAffector == Colors.ROTATE_CMD)
					velocity.x = speed;
				else 
					velocity.y = speed;
			}
			if (FlxG.keys.D || FlxG.keys.RIGHT)
			{
				if (colorAffector == Colors.ROTATE_CMD)
					velocity.y = -speed;
				else
					velocity.x = speed;
			}
			if (FlxG.keys.W || FlxG.keys.UP)
			{
				if (colorAffector == Colors.ROTATE_CMD)
					velocity.x = -speed;
				else
					velocity.y = -speed;
			}
		}
	}
	
}