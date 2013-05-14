package gui;
import nme.display.Graphics;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxText;

/**
 * ...
 * @author Masadow
 */
class Select extends FlxText
{

	public var options : Array<String>;
	
	public function new(x : Int, y : Int, label : String) 
	{
		super(x, y, 80, label);
		this.color = 0xFFFFFFFF;
		calcFrame();
	}
	
	override private function calcFrame():Void 
	{
		super.calcFrame();

		var gfx:Graphics = FlxG.flashGfx;
		gfx.clear();
		gfx.beginFill(0xFFFFFF);
		gfx.lineStyle(1, 0xFFFFFF);
		gfx.moveTo(65, 6);
		gfx.lineTo(71, 6);
		gfx.lineTo(68, 9);
		gfx.lineTo(65, 6);
		gfx.endFill();
		framePixels.draw(FlxG.flashGfxSprite);
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (FlxG.mouse.justPressed() && overlapsPoint(FlxG.mouse))
			showOptions();
		else
			hideOptions();
	}
	
	public function showOptions()
	{
		
	}
	
	public function hideOptions()
	{
		
	}
	
	
}