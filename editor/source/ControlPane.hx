package ;
import gui.List;
import gui.ListItem;
import gui.Select;
import org.flixel.FlxButton;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;
import org.flixel.FlxText;

/**
 * ...
 * @author Masadow
 */
class ControlPane extends FlxGroup
{

	private static var offset_x = 640;
	public var list : List;
	
	public function new() 
	{
		super();
		
		var bg = new FlxSprite(offset_x);		
		bg.makeGraphic(200, 480, 0xFF000000);
		add(bg);
		
		//Buttons
		add(new FlxButton(offset_x + 20, 30, "Import", importLevel));
		add(new FlxButton(offset_x + 120, 30, "Export", exportLevel));
		
		
		//Select of tiles
		list = new gui.List(offset_x + 20, 60);
		list.addItem("Basic", Colors.BASIC);
		list.addItem("Rotate command", Colors.ROTATE_CMD);
		list.addItem("Smooth", Colors.SMOOTH);
		list.addItem("Freeze", Colors.FREEZE);
		list.addItem("Blinking", Colors.BLINKING);
		list.addItem("Hide", Colors.HIDE);
		list.addItem("Fast", Colors.FAST);
		list.addItem("Potato", Colors.POTATO);
		list.addItem("Finish", Colors.FINISH);
		cast(list.members[0], gui.ListItem).selected = true;
		add(list);
	}
	
	private function importLevel(): Void
	{
		
	}
	
	private function exportLevel(): Void
	{
		
	}
	
}