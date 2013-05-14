package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;

class LevelSelectionState extends FlxState
{
	private var path :FlxPath;
	private var autoplayer : Player;
	private var save : FlxSave;
	private static var lastLevel = 8;
	private var endGame : Bool;

	public function new(lvlSuccess : Int = 0)
	{
		super();
		save = new FlxSave();
		
		save.bind("save");
		
		if (save.data.level == null)
			save.data.level = 1;
		else if (lvlSuccess >= save.data.level)
			save.data.level = lvlSuccess == lastLevel ? lvlSuccess : lvlSuccess + 1;
		
		save.flush();
		
		endGame = lvlSuccess == lastLevel;
	}
	
	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end

		var bg = new FlxSprite(0, 0, "levelselection.png");
		add(bg);

		autoplayer = new Player(60, 60);
		path = new FlxPath();
		path.add(60, 70);
		path.add(480, 70);
		path.add(480, 170);
		path.add(70, 170);
		path.add(70, 270);
		path.add(480, 270);
		path.add(480, 370);
		path.add(70, 370);
		path.add(70, 450);
		//bottom right
		path.add(570, 450);
		path.add(570, 15);
		path.add(60, 15);
		autoplayer.followPath(path);
		add(autoplayer);

		FlxG.playMusic("levelselection.mp3");
		
		for (i in 0 ... 30)
			add(new LevelButton(40 + 100 * (i % 6), 30 + 85 * Math.floor(i / 6), 1 + i, i >= save.data.level ? false : true));
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (endGame)
			FlxG.switchState(new EndGameState());
		//When player is done, loop again
		if (autoplayer.pathSpeed == 0)
			autoplayer.followPath(path);
		super.update();
	}
}
