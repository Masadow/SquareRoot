package common;
import org.flixel.FlxRect;

/**
 * ...
 * @author Masadow
 */
class Colors
{

	public static var PLAYER : UInt = 0xFFFFFFFF; // WHITE
	public static var ENEMIES : UInt = 0xFF000000; // BLACK
	
	public static var BASIC : UInt = 0xFF99D9EA; // CYAN
	public static var VOID : UInt = 0xFFC2C2C2; // GREY
	public static var ROTATE_CMD : UInt = 0xFFDC143C; // RED
	public static var SMOOTH : UInt = 0xFFFF8C00; // ORANGE
	public static var FREEZE : UInt = 0xFF1E90FF; // BLUE
	public static var BLINKING : UInt = 0xFFFFD700; // YELLOW
	public static var HIDE : UInt = 0xFF9932CC; // VIOLET
	public static var FAST : UInt = 0xFFFF69B4; // PINK
	public static var POTATO : UInt = 0xFFA0522D; // BROWN
	public static var START : UInt = 0x001; // -USELESS- but must be unique
	public static var FINISH : UInt = 0xFF32CD32; // GREEN

	public var color : UInt;
	public var rect : FlxRect;

	public function new(color : UInt, rect : FlxRect)
	{
		this.color = color;
		this.rect = rect;
	}
	
}