package gui;
import org.flixel.FlxText;

/**
 * ...
 * @author Masadow
 */
class ListItem extends FlxText
{
	
	public var selected : Bool;
	public var data : Dynamic;

	public function new(x : Int, y : Int, label : String, data : Dynamic) 
	{
		super(x, y, 120, label);
		this.data = data;
		selected = false;
	}
	
	override public function update():Void 
	{
		super.update();

		if (selected)
			this.color = 0xFFFF0000;
		else
			this.color = 0xFFFFFFFF;
	}
}