#if nme

import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		nme.Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		nme.Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new org.flixel.system.FlxPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		#if !fdb
		haxe.Log.trace = flashTrace;
		#end
		
		if (call_real)
			begin ();
	}

	#if !fdb
	private static function flashTrace( v : Dynamic, ?pos : haxe.PosInfos ) {
		var className = pos.className.substr(pos.className.lastIndexOf('.') + 1);
		var message = className+"::"+pos.methodName+":"+pos.lineNumber+": " + v;
		
        if (flash.external.ExternalInterface.available)
			flash.external.ExternalInterface.call("console.log", message);
		else untyped flash.Boot.__trace(v, pos);
    }
	#end
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, nme.display.DisplayObject)) {
				nme.Lib.current.addChild(cast instance);
			}	
		}
		
	}

	static function onEnter (_) {
		
		var loaded = nme.Lib.current.loaderInfo.bytesLoaded;
		var total = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="Beep")
			 
            return Assets.getSound ("Beep");
         
		
		if (inName=="levelselection.mp3")
			 
            return Assets.getSound ("levelselection.mp3");
         
		
		if (inName=="level0.mp3")
			 
            return Assets.getSound ("level0.mp3");
         
		
		if (inName=="level1.mp3")
			 
            return Assets.getSound ("level1.mp3");
         
		
		if (inName=="nuke.wav")
			 
            return Assets.getSound ("nuke.wav");
         
		
		if (inName=="levelselection.png")
			 
            return Assets.getBitmapData ("levelselection.png");
         
		
		if (inName=="endscreen.png")
			 
            return Assets.getBitmapData ("endscreen.png");
         
		
		if (inName=="potatonuke.png")
			 
            return Assets.getBitmapData ("potatonuke.png");
         
		
		if (inName=="icon1")
			 
            return Assets.getBitmapData ("icon1");
         
		
		if (inName=="icon1bis")
			 
            return Assets.getBitmapData ("icon1bis");
         
		
		if (inName=="icon2")
			 
            return Assets.getBitmapData ("icon2");
         
		
		if (inName=="icon2bis")
			 
            return Assets.getBitmapData ("icon2bis");
         
		
		if (inName=="icon3")
			 
            return Assets.getBitmapData ("icon3");
         
		
		if (inName=="icon3bis")
			 
            return Assets.getBitmapData ("icon3bis");
         
		
		if (inName=="icon4")
			 
            return Assets.getBitmapData ("icon4");
         
		
		if (inName=="icon4bis")
			 
            return Assets.getBitmapData ("icon4bis");
         
		
		if (inName=="icon5")
			 
            return Assets.getBitmapData ("icon5");
         
		
		if (inName=="icon5bis")
			 
            return Assets.getBitmapData ("icon5bis");
         
		
		if (inName=="icon6")
			 
            return Assets.getBitmapData ("icon6");
         
		
		if (inName=="icon6bis")
			 
            return Assets.getBitmapData ("icon6bis");
         
		
		if (inName=="icon7")
			 
            return Assets.getBitmapData ("icon7");
         
		
		if (inName=="icon7bis")
			 
            return Assets.getBitmapData ("icon7bis");
         
		
		if (inName=="icon8")
			 
            return Assets.getBitmapData ("icon8");
         
		
		if (inName=="icon8bis")
			 
            return Assets.getBitmapData ("icon8bis");
         
		
		if (inName=="icon9")
			 
            return Assets.getBitmapData ("icon9");
         
		
		if (inName=="icon9bis")
			 
            return Assets.getBitmapData ("icon9bis");
         
		
		if (inName=="icon10")
			 
            return Assets.getBitmapData ("icon10");
         
		
		if (inName=="icon10bis")
			 
            return Assets.getBitmapData ("icon10bis");
         
		
		if (inName=="icon11")
			 
            return Assets.getBitmapData ("icon11");
         
		
		if (inName=="icon11bis")
			 
            return Assets.getBitmapData ("icon11bis");
         
		
		if (inName=="icon12")
			 
            return Assets.getBitmapData ("icon12");
         
		
		if (inName=="icon12bis")
			 
            return Assets.getBitmapData ("icon12bis");
         
		
		if (inName=="icon13")
			 
            return Assets.getBitmapData ("icon13");
         
		
		if (inName=="icon13bis")
			 
            return Assets.getBitmapData ("icon13bis");
         
		
		if (inName=="icon14")
			 
            return Assets.getBitmapData ("icon14");
         
		
		if (inName=="icon14bis")
			 
            return Assets.getBitmapData ("icon14bis");
         
		
		if (inName=="icon15")
			 
            return Assets.getBitmapData ("icon15");
         
		
		if (inName=="icon15bis")
			 
            return Assets.getBitmapData ("icon15bis");
         
		
		if (inName=="icon16")
			 
            return Assets.getBitmapData ("icon16");
         
		
		if (inName=="icon16bis")
			 
            return Assets.getBitmapData ("icon16bis");
         
		
		if (inName=="icon17")
			 
            return Assets.getBitmapData ("icon17");
         
		
		if (inName=="icon17bis")
			 
            return Assets.getBitmapData ("icon17bis");
         
		
		if (inName=="icon18")
			 
            return Assets.getBitmapData ("icon18");
         
		
		if (inName=="icon18bis")
			 
            return Assets.getBitmapData ("icon18bis");
         
		
		if (inName=="icon19")
			 
            return Assets.getBitmapData ("icon19");
         
		
		if (inName=="icon19bis")
			 
            return Assets.getBitmapData ("icon19bis");
         
		
		if (inName=="icon20")
			 
            return Assets.getBitmapData ("icon20");
         
		
		if (inName=="icon20bis")
			 
            return Assets.getBitmapData ("icon20bis");
         
		
		if (inName=="icon21")
			 
            return Assets.getBitmapData ("icon21");
         
		
		if (inName=="icon21bis")
			 
            return Assets.getBitmapData ("icon21bis");
         
		
		if (inName=="icon22")
			 
            return Assets.getBitmapData ("icon22");
         
		
		if (inName=="icon22bis")
			 
            return Assets.getBitmapData ("icon22bis");
         
		
		if (inName=="icon23")
			 
            return Assets.getBitmapData ("icon23");
         
		
		if (inName=="icon23bis")
			 
            return Assets.getBitmapData ("icon23bis");
         
		
		if (inName=="icon24")
			 
            return Assets.getBitmapData ("icon24");
         
		
		if (inName=="icon24bis")
			 
            return Assets.getBitmapData ("icon24bis");
         
		
		if (inName=="icon25")
			 
            return Assets.getBitmapData ("icon25");
         
		
		if (inName=="icon25bis")
			 
            return Assets.getBitmapData ("icon25bis");
         
		
		if (inName=="icon26")
			 
            return Assets.getBitmapData ("icon26");
         
		
		if (inName=="icon26bis")
			 
            return Assets.getBitmapData ("icon26bis");
         
		
		if (inName=="icon27")
			 
            return Assets.getBitmapData ("icon27");
         
		
		if (inName=="icon27bis")
			 
            return Assets.getBitmapData ("icon27bis");
         
		
		if (inName=="icon28")
			 
            return Assets.getBitmapData ("icon28");
         
		
		if (inName=="icon28bis")
			 
            return Assets.getBitmapData ("icon28bis");
         
		
		if (inName=="icon29")
			 
            return Assets.getBitmapData ("icon29");
         
		
		if (inName=="icon29bis")
			 
            return Assets.getBitmapData ("icon29bis");
         
		
		if (inName=="icon30")
			 
            return Assets.getBitmapData ("icon30");
         
		
		if (inName=="icon30bis")
			 
            return Assets.getBitmapData ("icon30bis");
         
		
		if (inName=="level1")
			 
            return Assets.getBitmapData ("level1");
         
		
		if (inName=="level1.layout")
			 
			 return Assets.getText ("level1.layout");
         
		
		if (inName=="level2.layout")
			 
			 return Assets.getText ("level2.layout");
         
		
		if (inName=="level3.layout")
			 
			 return Assets.getText ("level3.layout");
         
		
		if (inName=="level4.layout")
			 
			 return Assets.getText ("level4.layout");
         
		
		if (inName=="level5.layout")
			 
			 return Assets.getText ("level5.layout");
         
		
		if (inName=="level6.layout")
			 
			 return Assets.getText ("level6.layout");
         
		
		if (inName=="level7.layout")
			 
			 return Assets.getText ("level7.layout");
         
		
		if (inName=="level8.layout")
			 
			 return Assets.getText ("level8.layout");
         
		
		if (inName=="assets/data/autotiles.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles.png");
         
		
		if (inName=="assets/data/autotiles_alt.png")
			 
            return Assets.getBitmapData ("assets/data/autotiles_alt.png");
         
		
		if (inName=="assets/data/base.png")
			 
            return Assets.getBitmapData ("assets/data/base.png");
         
		
		if (inName=="assets/data/beep.mp3")
			 
            return Assets.getSound ("assets/data/beep.mp3");
		 
		
		if (inName=="assets/data/button.png")
			 
            return Assets.getBitmapData ("assets/data/button.png");
         
		
		if (inName=="assets/data/button_a.png")
			 
            return Assets.getBitmapData ("assets/data/button_a.png");
         
		
		if (inName=="assets/data/button_b.png")
			 
            return Assets.getBitmapData ("assets/data/button_b.png");
         
		
		if (inName=="assets/data/button_c.png")
			 
            return Assets.getBitmapData ("assets/data/button_c.png");
         
		
		if (inName=="assets/data/button_down.png")
			 
            return Assets.getBitmapData ("assets/data/button_down.png");
         
		
		if (inName=="assets/data/button_left.png")
			 
            return Assets.getBitmapData ("assets/data/button_left.png");
         
		
		if (inName=="assets/data/button_right.png")
			 
            return Assets.getBitmapData ("assets/data/button_right.png");
         
		
		if (inName=="assets/data/button_up.png")
			 
            return Assets.getBitmapData ("assets/data/button_up.png");
         
		
		if (inName=="assets/data/button_x.png")
			 
            return Assets.getBitmapData ("assets/data/button_x.png");
         
		
		if (inName=="assets/data/button_y.png")
			 
            return Assets.getBitmapData ("assets/data/button_y.png");
         
		
		if (inName=="assets/data/courier.ttf")
			 
			 return Assets.getFont ("assets/data/courier.ttf");
		 
		
		if (inName=="assets/data/cursor.png")
			 
            return Assets.getBitmapData ("assets/data/cursor.png");
         
		
		if (inName=="assets/data/default.png")
			 
            return Assets.getBitmapData ("assets/data/default.png");
         
		
		if (inName=="assets/data/fontData10pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData10pt.png");
         
		
		if (inName=="assets/data/fontData11pt.png")
			 
            return Assets.getBitmapData ("assets/data/fontData11pt.png");
         
		
		if (inName=="assets/data/handle.png")
			 
            return Assets.getBitmapData ("assets/data/handle.png");
         
		
		if (inName=="assets/data/logo.png")
			 
            return Assets.getBitmapData ("assets/data/logo.png");
         
		
		if (inName=="assets/data/logo_corners.png")
			 
            return Assets.getBitmapData ("assets/data/logo_corners.png");
         
		
		if (inName=="assets/data/logo_light.png")
			 
            return Assets.getBitmapData ("assets/data/logo_light.png");
         
		
		if (inName=="assets/data/nokiafc22.ttf")
			 
			 return Assets.getFont ("assets/data/nokiafc22.ttf");
		 
		
		if (inName=="assets/data/stick.png")
			 
            return Assets.getBitmapData ("assets/data/stick.png");
         
		
		if (inName=="assets/data/vcr/flixel.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/flixel.png");
         
		
		if (inName=="assets/data/vcr/open.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/open.png");
         
		
		if (inName=="assets/data/vcr/pause.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/pause.png");
         
		
		if (inName=="assets/data/vcr/play.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/play.png");
         
		
		if (inName=="assets/data/vcr/record_off.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_off.png");
         
		
		if (inName=="assets/data/vcr/record_on.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/record_on.png");
         
		
		if (inName=="assets/data/vcr/restart.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/restart.png");
         
		
		if (inName=="assets/data/vcr/step.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/step.png");
         
		
		if (inName=="assets/data/vcr/stop.png")
			 
            return Assets.getBitmapData ("assets/data/vcr/stop.png");
         
		
		if (inName=="assets/data/vis/bounds.png")
			 
            return Assets.getBitmapData ("assets/data/vis/bounds.png");
         
		
		if (inName=="assets/endscreen.png")
			 
            return Assets.getBitmapData ("assets/endscreen.png");
         
		
		if (inName=="assets/HaxeFlixel.svg")
			 
			 return Assets.getText ("assets/HaxeFlixel.svg");
         
		
		if (inName=="assets/level/1.png")
			 
            return Assets.getBitmapData ("assets/level/1.png");
         
		
		if (inName=="assets/level/1.xml")
			 
			 return Assets.getText ("assets/level/1.xml");
         
		
		if (inName=="assets/level/2.xml")
			 
			 return Assets.getText ("assets/level/2.xml");
         
		
		if (inName=="assets/level/3.xml")
			 
			 return Assets.getText ("assets/level/3.xml");
         
		
		if (inName=="assets/level/4.xml")
			 
			 return Assets.getText ("assets/level/4.xml");
         
		
		if (inName=="assets/level/5.xml")
			 
			 return Assets.getText ("assets/level/5.xml");
         
		
		if (inName=="assets/level/6.xml")
			 
			 return Assets.getText ("assets/level/6.xml");
         
		
		if (inName=="assets/level/7.xml")
			 
			 return Assets.getText ("assets/level/7.xml");
         
		
		if (inName=="assets/level/8.xml")
			 
			 return Assets.getText ("assets/level/8.xml");
         
		
		if (inName=="assets/level/icon/1.png")
			 
            return Assets.getBitmapData ("assets/level/icon/1.png");
         
		
		if (inName=="assets/level/icon/10.png")
			 
            return Assets.getBitmapData ("assets/level/icon/10.png");
         
		
		if (inName=="assets/level/icon/10bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/10bis.png");
         
		
		if (inName=="assets/level/icon/11.png")
			 
            return Assets.getBitmapData ("assets/level/icon/11.png");
         
		
		if (inName=="assets/level/icon/11bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/11bis.png");
         
		
		if (inName=="assets/level/icon/12.png")
			 
            return Assets.getBitmapData ("assets/level/icon/12.png");
         
		
		if (inName=="assets/level/icon/12bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/12bis.png");
         
		
		if (inName=="assets/level/icon/13.png")
			 
            return Assets.getBitmapData ("assets/level/icon/13.png");
         
		
		if (inName=="assets/level/icon/13bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/13bis.png");
         
		
		if (inName=="assets/level/icon/14.png")
			 
            return Assets.getBitmapData ("assets/level/icon/14.png");
         
		
		if (inName=="assets/level/icon/14bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/14bis.png");
         
		
		if (inName=="assets/level/icon/15.png")
			 
            return Assets.getBitmapData ("assets/level/icon/15.png");
         
		
		if (inName=="assets/level/icon/15bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/15bis.png");
         
		
		if (inName=="assets/level/icon/16.png")
			 
            return Assets.getBitmapData ("assets/level/icon/16.png");
         
		
		if (inName=="assets/level/icon/16bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/16bis.png");
         
		
		if (inName=="assets/level/icon/17.png")
			 
            return Assets.getBitmapData ("assets/level/icon/17.png");
         
		
		if (inName=="assets/level/icon/17bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/17bis.png");
         
		
		if (inName=="assets/level/icon/18.png")
			 
            return Assets.getBitmapData ("assets/level/icon/18.png");
         
		
		if (inName=="assets/level/icon/18bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/18bis.png");
         
		
		if (inName=="assets/level/icon/19.png")
			 
            return Assets.getBitmapData ("assets/level/icon/19.png");
         
		
		if (inName=="assets/level/icon/19bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/19bis.png");
         
		
		if (inName=="assets/level/icon/1bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/1bis.png");
         
		
		if (inName=="assets/level/icon/2.png")
			 
            return Assets.getBitmapData ("assets/level/icon/2.png");
         
		
		if (inName=="assets/level/icon/20.png")
			 
            return Assets.getBitmapData ("assets/level/icon/20.png");
         
		
		if (inName=="assets/level/icon/20bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/20bis.png");
         
		
		if (inName=="assets/level/icon/21.png")
			 
            return Assets.getBitmapData ("assets/level/icon/21.png");
         
		
		if (inName=="assets/level/icon/21bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/21bis.png");
         
		
		if (inName=="assets/level/icon/22.png")
			 
            return Assets.getBitmapData ("assets/level/icon/22.png");
         
		
		if (inName=="assets/level/icon/22bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/22bis.png");
         
		
		if (inName=="assets/level/icon/23.png")
			 
            return Assets.getBitmapData ("assets/level/icon/23.png");
         
		
		if (inName=="assets/level/icon/23bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/23bis.png");
         
		
		if (inName=="assets/level/icon/24.png")
			 
            return Assets.getBitmapData ("assets/level/icon/24.png");
         
		
		if (inName=="assets/level/icon/24bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/24bis.png");
         
		
		if (inName=="assets/level/icon/25.png")
			 
            return Assets.getBitmapData ("assets/level/icon/25.png");
         
		
		if (inName=="assets/level/icon/25bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/25bis.png");
         
		
		if (inName=="assets/level/icon/26.png")
			 
            return Assets.getBitmapData ("assets/level/icon/26.png");
         
		
		if (inName=="assets/level/icon/26bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/26bis.png");
         
		
		if (inName=="assets/level/icon/27.png")
			 
            return Assets.getBitmapData ("assets/level/icon/27.png");
         
		
		if (inName=="assets/level/icon/27bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/27bis.png");
         
		
		if (inName=="assets/level/icon/28.png")
			 
            return Assets.getBitmapData ("assets/level/icon/28.png");
         
		
		if (inName=="assets/level/icon/28bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/28bis.png");
         
		
		if (inName=="assets/level/icon/29.png")
			 
            return Assets.getBitmapData ("assets/level/icon/29.png");
         
		
		if (inName=="assets/level/icon/29bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/29bis.png");
         
		
		if (inName=="assets/level/icon/2bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/2bis.png");
         
		
		if (inName=="assets/level/icon/3.png")
			 
            return Assets.getBitmapData ("assets/level/icon/3.png");
         
		
		if (inName=="assets/level/icon/30.png")
			 
            return Assets.getBitmapData ("assets/level/icon/30.png");
         
		
		if (inName=="assets/level/icon/30bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/30bis.png");
         
		
		if (inName=="assets/level/icon/3bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/3bis.png");
         
		
		if (inName=="assets/level/icon/4.png")
			 
            return Assets.getBitmapData ("assets/level/icon/4.png");
         
		
		if (inName=="assets/level/icon/4bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/4bis.png");
         
		
		if (inName=="assets/level/icon/5.png")
			 
            return Assets.getBitmapData ("assets/level/icon/5.png");
         
		
		if (inName=="assets/level/icon/5bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/5bis.png");
         
		
		if (inName=="assets/level/icon/6.png")
			 
            return Assets.getBitmapData ("assets/level/icon/6.png");
         
		
		if (inName=="assets/level/icon/6bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/6bis.png");
         
		
		if (inName=="assets/level/icon/7.png")
			 
            return Assets.getBitmapData ("assets/level/icon/7.png");
         
		
		if (inName=="assets/level/icon/7bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/7bis.png");
         
		
		if (inName=="assets/level/icon/8.png")
			 
            return Assets.getBitmapData ("assets/level/icon/8.png");
         
		
		if (inName=="assets/level/icon/8bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/8bis.png");
         
		
		if (inName=="assets/level/icon/9.png")
			 
            return Assets.getBitmapData ("assets/level/icon/9.png");
         
		
		if (inName=="assets/level/icon/9bis.png")
			 
            return Assets.getBitmapData ("assets/level/icon/9bis.png");
         
		
		if (inName=="assets/level0.mp3")
			 
            return Assets.getSound ("assets/level0.mp3");
		 
		
		if (inName=="assets/level1.mp3")
			 
            return Assets.getSound ("assets/level1.mp3");
		 
		
		if (inName=="assets/levelselection.mp3")
			 
            return Assets.getSound ("assets/levelselection.mp3");
		 
		
		if (inName=="assets/levelselection.png")
			 
            return Assets.getBitmapData ("assets/levelselection.png");
         
		
		if (inName=="assets/potatonuke.png")
			 
            return Assets.getBitmapData ("assets/potatonuke.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}

class NME_assets_data_beep_mp3 extends nme.media.Sound { }
class NME_assets_levelselection_mp3 extends nme.media.Sound { }
class NME_assets_level0_mp3 extends nme.media.Sound { }
class NME_assets_level1_mp3 extends nme.media.Sound { }
class NME_assets_nuke_wav extends nme.media.Sound { }
class NME_assets_levelselection_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_endscreen_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_potatonuke_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_1bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_2_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_2bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_3_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_3bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_4_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_4bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_5_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_5bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_6_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_6bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_7_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_7bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_8_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_8bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_9_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_9bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_10_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_10bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_11_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_11bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_12_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_12bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_13_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_13bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_14_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_14bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_15_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_15bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_16_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_16bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_17_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_17bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_18_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_18bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_19_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_19bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_20_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_20bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_21_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_21bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_22_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_22bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_23_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_23bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_24_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_24bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_25_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_25bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_26_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_26bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_27_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_27bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_28_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_28bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_29_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_29bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_30_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_30bis_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_1_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_1_xml extends nme.utils.ByteArray { }
class NME_assets_level_2_xml extends nme.utils.ByteArray { }
class NME_assets_level_3_xml extends nme.utils.ByteArray { }
class NME_assets_level_4_xml extends nme.utils.ByteArray { }
class NME_assets_level_5_xml extends nme.utils.ByteArray { }
class NME_assets_level_6_xml extends nme.utils.ByteArray { }
class NME_assets_level_7_xml extends nme.utils.ByteArray { }
class NME_assets_level_8_xml extends nme.utils.ByteArray { }
class NME_assets_data_autotiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_base_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends nme.media.Sound { }
class NME_assets_data_button_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_a_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_b_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_c_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_down_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_left_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_right_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_up_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_x_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_y_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends nme.text.Font { }
class NME_assets_data_cursor_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends nme.text.Font { }
class NME_assets_data_stick_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_endscreen_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_haxeflixel_svg extends nme.utils.ByteArray { }
class NME_assets_level_2 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_3 extends nme.utils.ByteArray { }
class NME_assets_level_4 extends nme.utils.ByteArray { }
class NME_assets_level_5 extends nme.utils.ByteArray { }
class NME_assets_level_6 extends nme.utils.ByteArray { }
class NME_assets_level_7 extends nme.utils.ByteArray { }
class NME_assets_level_8 extends nme.utils.ByteArray { }
class NME_assets_level_9 extends nme.utils.ByteArray { }
class NME_assets_level_10 extends nme.utils.ByteArray { }
class NME_assets_level_icon_2 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_11 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_12 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_13 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_14 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_15 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_16 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_17 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_18 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_19 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_20 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_21 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_22 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_23 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_24 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_25 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_26 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_27 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_28 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_29 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_30 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_3 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_4 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_31 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_32 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_33 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_34 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_35 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_36 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_37 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_38 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_39 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_40 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_41 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_42 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_43 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_44 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_45 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_46 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_47 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_48 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_49 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_50 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_5 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_6 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_51 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_52 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_7 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_8 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_9 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_10 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_53 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_54 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_55 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_56 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_57 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_58 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_59 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_60 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level_icon_61 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_level1 extends nme.media.Sound { }
class NME_assets_level2 extends nme.media.Sound { }
class NME_assets_levelselection_mp4 extends nme.media.Sound { }
class NME_assets_levelselection_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_potatonuke_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }


#else

import Main;

class ApplicationMain {
	
	public static function main () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(Main, []);
			if (Std.is (instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
		
	}

}

#end
