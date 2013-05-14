package gui;
import org.flixel.FlxG;
import org.flixel.FlxGroup;

/**
 * ...
 * @author Masadow
 */
class List extends FlxGroup
{
	
	public var x : Int;
	public var y : Int;
	
	public function new(x : Int, y : Int) 
	{
		super();
		
		this.x = x;
		this.y = y;
		
	}
	
	public function getSelection() : Null<ListItem>
	{
		for (m in members)
		{
			var i = cast(m, ListItem);
			if (i.selected)
				return i;
		}
		return null;
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (FlxG.mouse.justPressed())
		{
			var newSelection : Null<ListItem> = null;
			for (m in members)
			{
				var i = cast(m, ListItem);
				if (i.overlapsPoint(FlxG.mouse))
				{
					newSelection = i;
					break ;
				}
			}
			if (newSelection != null)
				for (m in members)
				{
					var i = cast(m, ListItem);
					if (i.selected)
						i.selected = false;
					else if (i == newSelection)
						i.selected = true;
				}
		}
	}
	
	public function addItem(label : String, data : Dynamic)
	{
		add(new ListItem(x, y + members.length * 20, label, data));
	}
}