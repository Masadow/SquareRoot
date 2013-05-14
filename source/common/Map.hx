package common;
import haxe.xml.Fast;
import nme.Assets;
import org.flixel.FlxGroup;
import org.flixel.FlxPath;
import org.flixel.FlxRect;
import org.flixel.FlxSprite;
import org.flixel.FlxPoint;

/**
 * ...
 * @author Masadow
 */
class Map extends FlxGroup
{

	public var start : FlxPoint;
	private var colors : Array<Colors>;
	public var enemies : FlxGroup;
	
	private inline function nodeToRect(node : Fast)
	{
		return new FlxRect(Std.parseFloat(node.att.x), Std.parseFloat(node.att.y), Std.parseFloat(node.att.w), Std.parseFloat(node.att.h));
	}
	
	public function new(lvl : Int) 
	{
		super();
//		super(0,0,"level" + lvl);

		if (lvl == 1)
			add(new FlxSprite(0,0, "level1"));
		var xml = Xml.parse(Assets.getText("level"+lvl+".layout"));
		var fast = new Fast(xml.firstElement());

		colors = new Array<Colors>();
		
		for (node in fast.nodes.basic)
			colors.push(new Colors(Colors.BASIC, nodeToRect(node)));
		for (node in fast.nodes.finish)
			colors.push(new Colors(Colors.FINISH, nodeToRect(node)));
		for (node in fast.nodes.rotate_cmd)
			colors.push(new Colors(Colors.ROTATE_CMD, nodeToRect(node)));
		for (node in fast.nodes.smooth)
			colors.push(new Colors(Colors.SMOOTH, nodeToRect(node)));
		for (node in fast.nodes.freeze)
			colors.push(new Colors(Colors.FREEZE, nodeToRect(node)));
		for (node in fast.nodes.blinking)
			colors.push(new Colors(Colors.BLINKING, nodeToRect(node)));
		for (node in fast.nodes.hide)
			colors.push(new Colors(Colors.HIDE, nodeToRect(node)));
		for (node in fast.nodes.fast)
			colors.push(new Colors(Colors.FAST, nodeToRect(node)));
		for (node in fast.nodes.potato)
			colors.push(new Colors(Colors.POTATO, nodeToRect(node)));
			
		for (color in colors)
		{
			var shape = new FlxSprite(color.rect.x, color.rect.y);
			shape.makeGraphic(cast(color.rect.width, Int), cast(color.rect.height, Int), color.color);
			add(shape);
		}
			
		enemies = new FlxGroup();

		for (enode in fast.nodes.enemy)
		{
			var e = new Enemy(Std.parseInt(enode.att.x), Std.parseInt(enode.att.y), Std.parseInt(enode.att.radius)); 
			var path = new FlxPath();
			for (p in enode.nodes.path)
				path.add(Std.parseFloat(p.att.x), Std.parseFloat(p.att.y));
			e.followPath(path);
			enemies.add(e);
		}
		
		start = new FlxPoint(Std.parseInt(fast.node.start.att.x), Std.parseInt(fast.node.start.att.y));
	}
	
	public function getColor(pos : FlxPoint) : UInt
	{
		for (c in colors)
			if (pos.x > c.rect.left && pos.x <= c.rect.right
				&& pos.y > c.rect.top && pos.y <= c.rect.bottom)
				return c.color;
		return Colors.VOID;
	}
	
}