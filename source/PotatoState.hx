package ;

import org.flixel.FlxState;
import org.flixel.FlxSprite;
import org.flixel.FlxG;

/**
 * ...
 * @author Masadow
 */
class PotatoState extends FlxState
{

	public override function create():Void
	{
		super.create();
		
		FlxG.music.stop();
		var bg = new FlxSprite(0, 0, "potatonuke.png");
		add(bg);
		FlxG.play("nuke.wav");
	}

	public override function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed() || FlxG.keys.justPressed("ESCAPE")
			|| FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("SPACE"))
			FlxG.switchState(new LevelState(8));
	}
}