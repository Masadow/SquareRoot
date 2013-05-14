package ;
import nme.display.Graphics;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

/**
 * ...
 * @author Masadow
 */
class Enemy extends FlxSprite
{

	public var radius : Int;
	
	public function new(x : Int, y : Int, radius : Int)
	{
		super(x, y);
		
		this.radius = radius;
		
		this.makeGraphic(radius * 2, radius * 2, 0x0);
	}
	
	override private function calcFrame():Void 
	{
		super.calcFrame();
		var gfx : Graphics = FlxG.flashGfx;
		gfx.clear();
		gfx.beginFill(0x0);
		gfx.drawCircle(radius, radius, radius);
		gfx.endFill();
		framePixels.draw(FlxG.flashGfxSprite);
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (pathSpeed == 0 && path != null)
			followPath(path);
	}
	
}