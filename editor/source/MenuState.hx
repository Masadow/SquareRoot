package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxPoint;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;

class MenuState extends FlxState
{
	private var firstPoint : Null<FlxPoint>;
	private var currentShape : FlxSprite;
	private var controlPane : ControlPane;

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
		
		controlPane = new ControlPane();
		add(controlPane);
		
		firstPoint = null;

		currentShape = new FlxSprite();
		currentShape.makeGraphic(1, 1, 0x0);
		add(currentShape);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed() && FlxG.mouse.x < 640 && controlPane.list.getSelection() != null)
		{
			if (firstPoint == null)
			{
				firstPoint = new FlxPoint();
				FlxG.mouse.copyTo(firstPoint);
			}
		}

		if (firstPoint != null && firstPoint.x != FlxG.mouse.x && firstPoint.y != FlxG.mouse.y)
		{
			var mouse_x = FlxG.mouse.x;
			if (FlxG.mouse.x >= 640)
				mouse_x = 639;
			currentShape.x = firstPoint.x > mouse_x ? mouse_x : firstPoint.x;
			currentShape.y = firstPoint.y > FlxG.mouse.y ? FlxG.mouse.y : firstPoint.y;
			currentShape.makeGraphic(cast(firstPoint.x > mouse_x ? firstPoint.x - mouse_x : mouse_x - firstPoint.x, UInt),
									cast(firstPoint.y > FlxG.mouse.y ? firstPoint.y - FlxG.mouse.y : FlxG.mouse.y - firstPoint.y, UInt),
									controlPane.list.getSelection().data);
		}
	}
	
}