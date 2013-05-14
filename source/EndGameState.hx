package ;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxState;

/**
 * ...
 * @author Masadow
 */
class EndGameState extends FlxState
{

	public override function create():Void
	{
		super.create();
		
		var bg = new FlxSprite(0, 0, "endscreen.png");
		add(bg);
	}

	public override function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed() || FlxG.keys.justPressed("ESCAPE")
			|| FlxG.keys.justPressed("ENTER") || FlxG.keys.justPressed("SPACE"))
			FlxG.switchState(new LevelSelectionState());
	}
}