package ;
import nme.display.Graphics;
import org.flixel.FlxButton;
import org.flixel.FlxG;

/**
 * ...
 * @author Masadow
 */
class LevelButton extends FlxButton
{
	private var lvl : Int;
	public var unlocked : Bool;

	public function new(x : Int, y : Int, lvl : Int, unlocked : Bool)
	{
		super(x, y);
		this.lvl = lvl;
		this.unlocked = unlocked;
		if (unlocked)
			loadGraphic("icon" + lvl, false, false, 64, 64, true, "levelbtnout" + lvl);
		else
			loadGraphic("icon"+lvl+"bis", false, false, 64, 64, true, "levelbtnin" + lvl);
		onOver = onOverImpl;
		onOut = onOutImpl;
		onUp = onUpImpl;
	}

	private function onOverImpl() : Void
	{
		if (unlocked)
			loadGraphic("icon"+lvl+"bis", false, false, 64, 64, true, "levelbtnin" + lvl);
	}

	private function onOutImpl() : Void
	{
		if (unlocked)
			loadGraphic("icon"+lvl, false, false, 64, 64, true, "levelbtnout" + lvl);
	}

	private function onUpImpl() : Void
	{
		if (unlocked)
			FlxG.switchState(new LevelState(lvl));
	}
}
