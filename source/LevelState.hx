package ;
import nme.geom.Rectangle;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import common.Map;
import common.Colors;


/**
 * ...
 * @author Masadow
 */
class LevelState extends FlxState
{
	private var lvl : Int;
	private var player : Player;
	private var map : Map;

	public function new(lvl : Int)
	{
		super();
		this.lvl = lvl;
	}
	
	public override function create()
	{ 
		#if !neko
		FlxG.bgColor = Colors.VOID;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end
		
		FlxG.playMusic("level" +(lvl % 2)+".mp3");
		
		map = new Map(lvl);
		add(map);
		add(map.enemies);
		
		player = new Player(cast(map.start.x, Int), cast(map.start.y, Int));
		add(player);
		
	}
	
	public override function update()
	{
		super.update();
		
		if (FlxG.keys.justPressed("ESCAPE"))
			FlxG.switchState(new LevelSelectionState());
		player.colorAffector = map.getColor(player.getMidpoint());
		if (player.overlaps(map.enemies) || player.colorAffector == Colors.VOID)
		{ //If player is dead, reset pos
			player.x = map.start.x;
			player.y = map.start.y;
			player.colorAffector = map.getColor(player.getMidpoint());
		}
		else if (player.colorAffector == Colors.FINISH)
			FlxG.switchState(new LevelSelectionState(lvl));
		else if (player.colorAffector == Colors.POTATO)
			FlxG.switchState(new PotatoState());
	}
	
}
