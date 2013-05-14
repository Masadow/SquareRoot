package nme.installer;


import format.display.MovieClip;
import haxe.Unserializer;
import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;

#if swf
import format.SWF;
#end

#if xfl
import format.XFL;
#end


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	#if swf private static var cachedSWFLibraries:Hash <SWF> = new Hash <SWF> (); #end
	#if xfl private static var cachedXFLLibraries:Hash <XFL> = new Hash <XFL> (); #end
	
	private static var initialized:Bool = false;
	private static var libraryTypes:Hash <String> = new Hash <String> ();
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("Beep", NME_assets_data_beep_mp3);
			resourceTypes.set ("Beep", "sound");
			resourceClasses.set ("levelselection.mp3", NME_assets_levelselection_mp3);
			resourceTypes.set ("levelselection.mp3", "sound");
			resourceClasses.set ("level0.mp3", NME_assets_level0_mp3);
			resourceTypes.set ("level0.mp3", "sound");
			resourceClasses.set ("level1.mp3", NME_assets_level1_mp3);
			resourceTypes.set ("level1.mp3", "sound");
			resourceClasses.set ("nuke.wav", NME_assets_nuke_wav);
			resourceTypes.set ("nuke.wav", "sound");
			resourceClasses.set ("levelselection.png", NME_assets_levelselection_png);
			resourceTypes.set ("levelselection.png", "image");
			resourceClasses.set ("endscreen.png", NME_assets_endscreen_png);
			resourceTypes.set ("endscreen.png", "image");
			resourceClasses.set ("potatonuke.png", NME_assets_potatonuke_png);
			resourceTypes.set ("potatonuke.png", "image");
			resourceClasses.set ("icon1", NME_assets_level_icon_1_png);
			resourceTypes.set ("icon1", "image");
			resourceClasses.set ("icon1bis", NME_assets_level_icon_1bis_png);
			resourceTypes.set ("icon1bis", "image");
			resourceClasses.set ("icon2", NME_assets_level_icon_2_png);
			resourceTypes.set ("icon2", "image");
			resourceClasses.set ("icon2bis", NME_assets_level_icon_2bis_png);
			resourceTypes.set ("icon2bis", "image");
			resourceClasses.set ("icon3", NME_assets_level_icon_3_png);
			resourceTypes.set ("icon3", "image");
			resourceClasses.set ("icon3bis", NME_assets_level_icon_3bis_png);
			resourceTypes.set ("icon3bis", "image");
			resourceClasses.set ("icon4", NME_assets_level_icon_4_png);
			resourceTypes.set ("icon4", "image");
			resourceClasses.set ("icon4bis", NME_assets_level_icon_4bis_png);
			resourceTypes.set ("icon4bis", "image");
			resourceClasses.set ("icon5", NME_assets_level_icon_5_png);
			resourceTypes.set ("icon5", "image");
			resourceClasses.set ("icon5bis", NME_assets_level_icon_5bis_png);
			resourceTypes.set ("icon5bis", "image");
			resourceClasses.set ("icon6", NME_assets_level_icon_6_png);
			resourceTypes.set ("icon6", "image");
			resourceClasses.set ("icon6bis", NME_assets_level_icon_6bis_png);
			resourceTypes.set ("icon6bis", "image");
			resourceClasses.set ("icon7", NME_assets_level_icon_7_png);
			resourceTypes.set ("icon7", "image");
			resourceClasses.set ("icon7bis", NME_assets_level_icon_7bis_png);
			resourceTypes.set ("icon7bis", "image");
			resourceClasses.set ("icon8", NME_assets_level_icon_8_png);
			resourceTypes.set ("icon8", "image");
			resourceClasses.set ("icon8bis", NME_assets_level_icon_8bis_png);
			resourceTypes.set ("icon8bis", "image");
			resourceClasses.set ("icon9", NME_assets_level_icon_9_png);
			resourceTypes.set ("icon9", "image");
			resourceClasses.set ("icon9bis", NME_assets_level_icon_9bis_png);
			resourceTypes.set ("icon9bis", "image");
			resourceClasses.set ("icon10", NME_assets_level_icon_10_png);
			resourceTypes.set ("icon10", "image");
			resourceClasses.set ("icon10bis", NME_assets_level_icon_10bis_png);
			resourceTypes.set ("icon10bis", "image");
			resourceClasses.set ("icon11", NME_assets_level_icon_11_png);
			resourceTypes.set ("icon11", "image");
			resourceClasses.set ("icon11bis", NME_assets_level_icon_11bis_png);
			resourceTypes.set ("icon11bis", "image");
			resourceClasses.set ("icon12", NME_assets_level_icon_12_png);
			resourceTypes.set ("icon12", "image");
			resourceClasses.set ("icon12bis", NME_assets_level_icon_12bis_png);
			resourceTypes.set ("icon12bis", "image");
			resourceClasses.set ("icon13", NME_assets_level_icon_13_png);
			resourceTypes.set ("icon13", "image");
			resourceClasses.set ("icon13bis", NME_assets_level_icon_13bis_png);
			resourceTypes.set ("icon13bis", "image");
			resourceClasses.set ("icon14", NME_assets_level_icon_14_png);
			resourceTypes.set ("icon14", "image");
			resourceClasses.set ("icon14bis", NME_assets_level_icon_14bis_png);
			resourceTypes.set ("icon14bis", "image");
			resourceClasses.set ("icon15", NME_assets_level_icon_15_png);
			resourceTypes.set ("icon15", "image");
			resourceClasses.set ("icon15bis", NME_assets_level_icon_15bis_png);
			resourceTypes.set ("icon15bis", "image");
			resourceClasses.set ("icon16", NME_assets_level_icon_16_png);
			resourceTypes.set ("icon16", "image");
			resourceClasses.set ("icon16bis", NME_assets_level_icon_16bis_png);
			resourceTypes.set ("icon16bis", "image");
			resourceClasses.set ("icon17", NME_assets_level_icon_17_png);
			resourceTypes.set ("icon17", "image");
			resourceClasses.set ("icon17bis", NME_assets_level_icon_17bis_png);
			resourceTypes.set ("icon17bis", "image");
			resourceClasses.set ("icon18", NME_assets_level_icon_18_png);
			resourceTypes.set ("icon18", "image");
			resourceClasses.set ("icon18bis", NME_assets_level_icon_18bis_png);
			resourceTypes.set ("icon18bis", "image");
			resourceClasses.set ("icon19", NME_assets_level_icon_19_png);
			resourceTypes.set ("icon19", "image");
			resourceClasses.set ("icon19bis", NME_assets_level_icon_19bis_png);
			resourceTypes.set ("icon19bis", "image");
			resourceClasses.set ("icon20", NME_assets_level_icon_20_png);
			resourceTypes.set ("icon20", "image");
			resourceClasses.set ("icon20bis", NME_assets_level_icon_20bis_png);
			resourceTypes.set ("icon20bis", "image");
			resourceClasses.set ("icon21", NME_assets_level_icon_21_png);
			resourceTypes.set ("icon21", "image");
			resourceClasses.set ("icon21bis", NME_assets_level_icon_21bis_png);
			resourceTypes.set ("icon21bis", "image");
			resourceClasses.set ("icon22", NME_assets_level_icon_22_png);
			resourceTypes.set ("icon22", "image");
			resourceClasses.set ("icon22bis", NME_assets_level_icon_22bis_png);
			resourceTypes.set ("icon22bis", "image");
			resourceClasses.set ("icon23", NME_assets_level_icon_23_png);
			resourceTypes.set ("icon23", "image");
			resourceClasses.set ("icon23bis", NME_assets_level_icon_23bis_png);
			resourceTypes.set ("icon23bis", "image");
			resourceClasses.set ("icon24", NME_assets_level_icon_24_png);
			resourceTypes.set ("icon24", "image");
			resourceClasses.set ("icon24bis", NME_assets_level_icon_24bis_png);
			resourceTypes.set ("icon24bis", "image");
			resourceClasses.set ("icon25", NME_assets_level_icon_25_png);
			resourceTypes.set ("icon25", "image");
			resourceClasses.set ("icon25bis", NME_assets_level_icon_25bis_png);
			resourceTypes.set ("icon25bis", "image");
			resourceClasses.set ("icon26", NME_assets_level_icon_26_png);
			resourceTypes.set ("icon26", "image");
			resourceClasses.set ("icon26bis", NME_assets_level_icon_26bis_png);
			resourceTypes.set ("icon26bis", "image");
			resourceClasses.set ("icon27", NME_assets_level_icon_27_png);
			resourceTypes.set ("icon27", "image");
			resourceClasses.set ("icon27bis", NME_assets_level_icon_27bis_png);
			resourceTypes.set ("icon27bis", "image");
			resourceClasses.set ("icon28", NME_assets_level_icon_28_png);
			resourceTypes.set ("icon28", "image");
			resourceClasses.set ("icon28bis", NME_assets_level_icon_28bis_png);
			resourceTypes.set ("icon28bis", "image");
			resourceClasses.set ("icon29", NME_assets_level_icon_29_png);
			resourceTypes.set ("icon29", "image");
			resourceClasses.set ("icon29bis", NME_assets_level_icon_29bis_png);
			resourceTypes.set ("icon29bis", "image");
			resourceClasses.set ("icon30", NME_assets_level_icon_30_png);
			resourceTypes.set ("icon30", "image");
			resourceClasses.set ("icon30bis", NME_assets_level_icon_30bis_png);
			resourceTypes.set ("icon30bis", "image");
			resourceClasses.set ("level1", NME_assets_level_1_png);
			resourceTypes.set ("level1", "image");
			resourceClasses.set ("level1.layout", NME_assets_level_1_xml);
			resourceTypes.set ("level1.layout", "text");
			resourceClasses.set ("level2.layout", NME_assets_level_2_xml);
			resourceTypes.set ("level2.layout", "text");
			resourceClasses.set ("level3.layout", NME_assets_level_3_xml);
			resourceTypes.set ("level3.layout", "text");
			resourceClasses.set ("level4.layout", NME_assets_level_4_xml);
			resourceTypes.set ("level4.layout", "text");
			resourceClasses.set ("level5.layout", NME_assets_level_5_xml);
			resourceTypes.set ("level5.layout", "text");
			resourceClasses.set ("level6.layout", NME_assets_level_6_xml);
			resourceTypes.set ("level6.layout", "text");
			resourceClasses.set ("level7.layout", NME_assets_level_7_xml);
			resourceTypes.set ("level7.layout", "text");
			resourceClasses.set ("level8.layout", NME_assets_level_8_xml);
			resourceTypes.set ("level8.layout", "text");
			resourceClasses.set ("assets/data/autotiles.png", NME_assets_data_autotiles_png);
			resourceTypes.set ("assets/data/autotiles.png", "image");
			resourceClasses.set ("assets/data/autotiles_alt.png", NME_assets_data_autotiles_alt_png);
			resourceTypes.set ("assets/data/autotiles_alt.png", "image");
			resourceClasses.set ("assets/data/base.png", NME_assets_data_base_png);
			resourceTypes.set ("assets/data/base.png", "image");
			resourceClasses.set ("assets/data/beep.mp3", NME_assets_data_beep_mp4);
			resourceTypes.set ("assets/data/beep.mp3", "music");
			resourceClasses.set ("assets/data/button.png", NME_assets_data_button_png);
			resourceTypes.set ("assets/data/button.png", "image");
			resourceClasses.set ("assets/data/button_a.png", NME_assets_data_button_a_png);
			resourceTypes.set ("assets/data/button_a.png", "image");
			resourceClasses.set ("assets/data/button_b.png", NME_assets_data_button_b_png);
			resourceTypes.set ("assets/data/button_b.png", "image");
			resourceClasses.set ("assets/data/button_c.png", NME_assets_data_button_c_png);
			resourceTypes.set ("assets/data/button_c.png", "image");
			resourceClasses.set ("assets/data/button_down.png", NME_assets_data_button_down_png);
			resourceTypes.set ("assets/data/button_down.png", "image");
			resourceClasses.set ("assets/data/button_left.png", NME_assets_data_button_left_png);
			resourceTypes.set ("assets/data/button_left.png", "image");
			resourceClasses.set ("assets/data/button_right.png", NME_assets_data_button_right_png);
			resourceTypes.set ("assets/data/button_right.png", "image");
			resourceClasses.set ("assets/data/button_up.png", NME_assets_data_button_up_png);
			resourceTypes.set ("assets/data/button_up.png", "image");
			resourceClasses.set ("assets/data/button_x.png", NME_assets_data_button_x_png);
			resourceTypes.set ("assets/data/button_x.png", "image");
			resourceClasses.set ("assets/data/button_y.png", NME_assets_data_button_y_png);
			resourceTypes.set ("assets/data/button_y.png", "image");
			resourceClasses.set ("assets/data/courier.ttf", NME_assets_data_courier_ttf);
			resourceTypes.set ("assets/data/courier.ttf", "font");
			resourceClasses.set ("assets/data/cursor.png", NME_assets_data_cursor_png);
			resourceTypes.set ("assets/data/cursor.png", "image");
			resourceClasses.set ("assets/data/default.png", NME_assets_data_default_png);
			resourceTypes.set ("assets/data/default.png", "image");
			resourceClasses.set ("assets/data/fontData10pt.png", NME_assets_data_fontdata10pt_png);
			resourceTypes.set ("assets/data/fontData10pt.png", "image");
			resourceClasses.set ("assets/data/fontData11pt.png", NME_assets_data_fontdata11pt_png);
			resourceTypes.set ("assets/data/fontData11pt.png", "image");
			resourceClasses.set ("assets/data/handle.png", NME_assets_data_handle_png);
			resourceTypes.set ("assets/data/handle.png", "image");
			resourceClasses.set ("assets/data/logo.png", NME_assets_data_logo_png);
			resourceTypes.set ("assets/data/logo.png", "image");
			resourceClasses.set ("assets/data/logo_corners.png", NME_assets_data_logo_corners_png);
			resourceTypes.set ("assets/data/logo_corners.png", "image");
			resourceClasses.set ("assets/data/logo_light.png", NME_assets_data_logo_light_png);
			resourceTypes.set ("assets/data/logo_light.png", "image");
			resourceClasses.set ("assets/data/nokiafc22.ttf", NME_assets_data_nokiafc22_ttf);
			resourceTypes.set ("assets/data/nokiafc22.ttf", "font");
			resourceClasses.set ("assets/data/stick.png", NME_assets_data_stick_png);
			resourceTypes.set ("assets/data/stick.png", "image");
			resourceClasses.set ("assets/data/vcr/flixel.png", NME_assets_data_vcr_flixel_png);
			resourceTypes.set ("assets/data/vcr/flixel.png", "image");
			resourceClasses.set ("assets/data/vcr/open.png", NME_assets_data_vcr_open_png);
			resourceTypes.set ("assets/data/vcr/open.png", "image");
			resourceClasses.set ("assets/data/vcr/pause.png", NME_assets_data_vcr_pause_png);
			resourceTypes.set ("assets/data/vcr/pause.png", "image");
			resourceClasses.set ("assets/data/vcr/play.png", NME_assets_data_vcr_play_png);
			resourceTypes.set ("assets/data/vcr/play.png", "image");
			resourceClasses.set ("assets/data/vcr/record_off.png", NME_assets_data_vcr_record_off_png);
			resourceTypes.set ("assets/data/vcr/record_off.png", "image");
			resourceClasses.set ("assets/data/vcr/record_on.png", NME_assets_data_vcr_record_on_png);
			resourceTypes.set ("assets/data/vcr/record_on.png", "image");
			resourceClasses.set ("assets/data/vcr/restart.png", NME_assets_data_vcr_restart_png);
			resourceTypes.set ("assets/data/vcr/restart.png", "image");
			resourceClasses.set ("assets/data/vcr/step.png", NME_assets_data_vcr_step_png);
			resourceTypes.set ("assets/data/vcr/step.png", "image");
			resourceClasses.set ("assets/data/vcr/stop.png", NME_assets_data_vcr_stop_png);
			resourceTypes.set ("assets/data/vcr/stop.png", "image");
			resourceClasses.set ("assets/data/vis/bounds.png", NME_assets_data_vis_bounds_png);
			resourceTypes.set ("assets/data/vis/bounds.png", "image");
			resourceClasses.set ("assets/endscreen.png", NME_assets_endscreen_png1);
			resourceTypes.set ("assets/endscreen.png", "image");
			resourceClasses.set ("assets/HaxeFlixel.svg", NME_assets_haxeflixel_svg);
			resourceTypes.set ("assets/HaxeFlixel.svg", "text");
			resourceClasses.set ("assets/level/1.png", NME_assets_level_2);
			resourceTypes.set ("assets/level/1.png", "image");
			resourceClasses.set ("assets/level/1.xml", NME_assets_level_3);
			resourceTypes.set ("assets/level/1.xml", "text");
			resourceClasses.set ("assets/level/2.xml", NME_assets_level_4);
			resourceTypes.set ("assets/level/2.xml", "text");
			resourceClasses.set ("assets/level/3.xml", NME_assets_level_5);
			resourceTypes.set ("assets/level/3.xml", "text");
			resourceClasses.set ("assets/level/4.xml", NME_assets_level_6);
			resourceTypes.set ("assets/level/4.xml", "text");
			resourceClasses.set ("assets/level/5.xml", NME_assets_level_7);
			resourceTypes.set ("assets/level/5.xml", "text");
			resourceClasses.set ("assets/level/6.xml", NME_assets_level_8);
			resourceTypes.set ("assets/level/6.xml", "text");
			resourceClasses.set ("assets/level/7.xml", NME_assets_level_9);
			resourceTypes.set ("assets/level/7.xml", "text");
			resourceClasses.set ("assets/level/8.xml", NME_assets_level_10);
			resourceTypes.set ("assets/level/8.xml", "text");
			resourceClasses.set ("assets/level/icon/1.png", NME_assets_level_icon_2);
			resourceTypes.set ("assets/level/icon/1.png", "image");
			resourceClasses.set ("assets/level/icon/10.png", NME_assets_level_icon_11);
			resourceTypes.set ("assets/level/icon/10.png", "image");
			resourceClasses.set ("assets/level/icon/10bis.png", NME_assets_level_icon_12);
			resourceTypes.set ("assets/level/icon/10bis.png", "image");
			resourceClasses.set ("assets/level/icon/11.png", NME_assets_level_icon_13);
			resourceTypes.set ("assets/level/icon/11.png", "image");
			resourceClasses.set ("assets/level/icon/11bis.png", NME_assets_level_icon_14);
			resourceTypes.set ("assets/level/icon/11bis.png", "image");
			resourceClasses.set ("assets/level/icon/12.png", NME_assets_level_icon_15);
			resourceTypes.set ("assets/level/icon/12.png", "image");
			resourceClasses.set ("assets/level/icon/12bis.png", NME_assets_level_icon_16);
			resourceTypes.set ("assets/level/icon/12bis.png", "image");
			resourceClasses.set ("assets/level/icon/13.png", NME_assets_level_icon_17);
			resourceTypes.set ("assets/level/icon/13.png", "image");
			resourceClasses.set ("assets/level/icon/13bis.png", NME_assets_level_icon_18);
			resourceTypes.set ("assets/level/icon/13bis.png", "image");
			resourceClasses.set ("assets/level/icon/14.png", NME_assets_level_icon_19);
			resourceTypes.set ("assets/level/icon/14.png", "image");
			resourceClasses.set ("assets/level/icon/14bis.png", NME_assets_level_icon_20);
			resourceTypes.set ("assets/level/icon/14bis.png", "image");
			resourceClasses.set ("assets/level/icon/15.png", NME_assets_level_icon_21);
			resourceTypes.set ("assets/level/icon/15.png", "image");
			resourceClasses.set ("assets/level/icon/15bis.png", NME_assets_level_icon_22);
			resourceTypes.set ("assets/level/icon/15bis.png", "image");
			resourceClasses.set ("assets/level/icon/16.png", NME_assets_level_icon_23);
			resourceTypes.set ("assets/level/icon/16.png", "image");
			resourceClasses.set ("assets/level/icon/16bis.png", NME_assets_level_icon_24);
			resourceTypes.set ("assets/level/icon/16bis.png", "image");
			resourceClasses.set ("assets/level/icon/17.png", NME_assets_level_icon_25);
			resourceTypes.set ("assets/level/icon/17.png", "image");
			resourceClasses.set ("assets/level/icon/17bis.png", NME_assets_level_icon_26);
			resourceTypes.set ("assets/level/icon/17bis.png", "image");
			resourceClasses.set ("assets/level/icon/18.png", NME_assets_level_icon_27);
			resourceTypes.set ("assets/level/icon/18.png", "image");
			resourceClasses.set ("assets/level/icon/18bis.png", NME_assets_level_icon_28);
			resourceTypes.set ("assets/level/icon/18bis.png", "image");
			resourceClasses.set ("assets/level/icon/19.png", NME_assets_level_icon_29);
			resourceTypes.set ("assets/level/icon/19.png", "image");
			resourceClasses.set ("assets/level/icon/19bis.png", NME_assets_level_icon_30);
			resourceTypes.set ("assets/level/icon/19bis.png", "image");
			resourceClasses.set ("assets/level/icon/1bis.png", NME_assets_level_icon_3);
			resourceTypes.set ("assets/level/icon/1bis.png", "image");
			resourceClasses.set ("assets/level/icon/2.png", NME_assets_level_icon_4);
			resourceTypes.set ("assets/level/icon/2.png", "image");
			resourceClasses.set ("assets/level/icon/20.png", NME_assets_level_icon_31);
			resourceTypes.set ("assets/level/icon/20.png", "image");
			resourceClasses.set ("assets/level/icon/20bis.png", NME_assets_level_icon_32);
			resourceTypes.set ("assets/level/icon/20bis.png", "image");
			resourceClasses.set ("assets/level/icon/21.png", NME_assets_level_icon_33);
			resourceTypes.set ("assets/level/icon/21.png", "image");
			resourceClasses.set ("assets/level/icon/21bis.png", NME_assets_level_icon_34);
			resourceTypes.set ("assets/level/icon/21bis.png", "image");
			resourceClasses.set ("assets/level/icon/22.png", NME_assets_level_icon_35);
			resourceTypes.set ("assets/level/icon/22.png", "image");
			resourceClasses.set ("assets/level/icon/22bis.png", NME_assets_level_icon_36);
			resourceTypes.set ("assets/level/icon/22bis.png", "image");
			resourceClasses.set ("assets/level/icon/23.png", NME_assets_level_icon_37);
			resourceTypes.set ("assets/level/icon/23.png", "image");
			resourceClasses.set ("assets/level/icon/23bis.png", NME_assets_level_icon_38);
			resourceTypes.set ("assets/level/icon/23bis.png", "image");
			resourceClasses.set ("assets/level/icon/24.png", NME_assets_level_icon_39);
			resourceTypes.set ("assets/level/icon/24.png", "image");
			resourceClasses.set ("assets/level/icon/24bis.png", NME_assets_level_icon_40);
			resourceTypes.set ("assets/level/icon/24bis.png", "image");
			resourceClasses.set ("assets/level/icon/25.png", NME_assets_level_icon_41);
			resourceTypes.set ("assets/level/icon/25.png", "image");
			resourceClasses.set ("assets/level/icon/25bis.png", NME_assets_level_icon_42);
			resourceTypes.set ("assets/level/icon/25bis.png", "image");
			resourceClasses.set ("assets/level/icon/26.png", NME_assets_level_icon_43);
			resourceTypes.set ("assets/level/icon/26.png", "image");
			resourceClasses.set ("assets/level/icon/26bis.png", NME_assets_level_icon_44);
			resourceTypes.set ("assets/level/icon/26bis.png", "image");
			resourceClasses.set ("assets/level/icon/27.png", NME_assets_level_icon_45);
			resourceTypes.set ("assets/level/icon/27.png", "image");
			resourceClasses.set ("assets/level/icon/27bis.png", NME_assets_level_icon_46);
			resourceTypes.set ("assets/level/icon/27bis.png", "image");
			resourceClasses.set ("assets/level/icon/28.png", NME_assets_level_icon_47);
			resourceTypes.set ("assets/level/icon/28.png", "image");
			resourceClasses.set ("assets/level/icon/28bis.png", NME_assets_level_icon_48);
			resourceTypes.set ("assets/level/icon/28bis.png", "image");
			resourceClasses.set ("assets/level/icon/29.png", NME_assets_level_icon_49);
			resourceTypes.set ("assets/level/icon/29.png", "image");
			resourceClasses.set ("assets/level/icon/29bis.png", NME_assets_level_icon_50);
			resourceTypes.set ("assets/level/icon/29bis.png", "image");
			resourceClasses.set ("assets/level/icon/2bis.png", NME_assets_level_icon_5);
			resourceTypes.set ("assets/level/icon/2bis.png", "image");
			resourceClasses.set ("assets/level/icon/3.png", NME_assets_level_icon_6);
			resourceTypes.set ("assets/level/icon/3.png", "image");
			resourceClasses.set ("assets/level/icon/30.png", NME_assets_level_icon_51);
			resourceTypes.set ("assets/level/icon/30.png", "image");
			resourceClasses.set ("assets/level/icon/30bis.png", NME_assets_level_icon_52);
			resourceTypes.set ("assets/level/icon/30bis.png", "image");
			resourceClasses.set ("assets/level/icon/3bis.png", NME_assets_level_icon_7);
			resourceTypes.set ("assets/level/icon/3bis.png", "image");
			resourceClasses.set ("assets/level/icon/4.png", NME_assets_level_icon_8);
			resourceTypes.set ("assets/level/icon/4.png", "image");
			resourceClasses.set ("assets/level/icon/4bis.png", NME_assets_level_icon_9);
			resourceTypes.set ("assets/level/icon/4bis.png", "image");
			resourceClasses.set ("assets/level/icon/5.png", NME_assets_level_icon_10);
			resourceTypes.set ("assets/level/icon/5.png", "image");
			resourceClasses.set ("assets/level/icon/5bis.png", NME_assets_level_icon_53);
			resourceTypes.set ("assets/level/icon/5bis.png", "image");
			resourceClasses.set ("assets/level/icon/6.png", NME_assets_level_icon_54);
			resourceTypes.set ("assets/level/icon/6.png", "image");
			resourceClasses.set ("assets/level/icon/6bis.png", NME_assets_level_icon_55);
			resourceTypes.set ("assets/level/icon/6bis.png", "image");
			resourceClasses.set ("assets/level/icon/7.png", NME_assets_level_icon_56);
			resourceTypes.set ("assets/level/icon/7.png", "image");
			resourceClasses.set ("assets/level/icon/7bis.png", NME_assets_level_icon_57);
			resourceTypes.set ("assets/level/icon/7bis.png", "image");
			resourceClasses.set ("assets/level/icon/8.png", NME_assets_level_icon_58);
			resourceTypes.set ("assets/level/icon/8.png", "image");
			resourceClasses.set ("assets/level/icon/8bis.png", NME_assets_level_icon_59);
			resourceTypes.set ("assets/level/icon/8bis.png", "image");
			resourceClasses.set ("assets/level/icon/9.png", NME_assets_level_icon_60);
			resourceTypes.set ("assets/level/icon/9.png", "image");
			resourceClasses.set ("assets/level/icon/9bis.png", NME_assets_level_icon_61);
			resourceTypes.set ("assets/level/icon/9bis.png", "image");
			resourceClasses.set ("assets/level0.mp3", NME_assets_level1);
			resourceTypes.set ("assets/level0.mp3", "music");
			resourceClasses.set ("assets/level1.mp3", NME_assets_level2);
			resourceTypes.set ("assets/level1.mp3", "music");
			resourceClasses.set ("assets/levelselection.mp3", NME_assets_levelselection_mp4);
			resourceTypes.set ("assets/levelselection.mp3", "music");
			resourceClasses.set ("assets/levelselection.png", NME_assets_levelselection_png1);
			resourceTypes.set ("assets/levelselection.png", "image");
			resourceClasses.set ("assets/potatonuke.png", NME_assets_potatonuke_png1);
			resourceTypes.set ("assets/potatonuke.png", "image");
			
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else if (id.indexOf (":") > -1) {
			
			var libraryName = id.substr (0, id.indexOf (":"));
			var symbolName = id.substr (id.indexOf (":") + 1);
			
			if (libraryTypes.exists (libraryName)) {
				
				#if swf
				
				if (libraryTypes.get (libraryName) == "swf") {
					
					if (!cachedSWFLibraries.exists (libraryName)) {
						
						cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
						
					}
					
					return cachedSWFLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
				#if xfl
				
				if (libraryTypes.get (libraryName) == "xfl") {
					
					if (!cachedXFLLibraries.exists (libraryName)) {
						
						cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
						
					}
					
					return cachedXFLLibraries.get (libraryName).getBitmapData (symbolName);
					
				}
				
				#end
				
			} else {
				
				trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceClasses.exists (id)) {
			
			return Type.createInstance (resourceClasses.get (id), []);
			
		} else {
			
			trace ("[nme.Assets] There is no ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id).toLowerCase () == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getMovieClip (id:String):MovieClip {
		
		initialize ();
		
		var libraryName = id.substr (0, id.indexOf (":"));
		var symbolName = id.substr (id.indexOf (":") + 1);
		
		if (libraryTypes.exists (libraryName)) {
			
			#if swf
			
			if (libraryTypes.get (libraryName) == "swf") {
				
				if (!cachedSWFLibraries.exists (libraryName)) {
					
					cachedSWFLibraries.set (libraryName, new SWF (getBytes ("libraries/" + libraryName + ".swf")));
					
				}
				
				return cachedSWFLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
			#if xfl
			
			if (libraryTypes.get (libraryName) == "xfl") {
				
				if (!cachedXFLLibraries.exists (libraryName)) {
					
					cachedXFLLibraries.set (libraryName, Unserializer.run (getText ("libraries/" + libraryName + "/" + libraryName + ".dat")));
					
				}
				
				return cachedXFLLibraries.get (libraryName).createMovieClip (symbolName);
				
			}
			
			#end
			
		} else {
			
			trace ("[nme.Assets] There is no asset library named \"" + libraryName + "\"");
			
		}
		
		return null;
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id).toLowerCase () == "sound" || resourceTypes.get (id).toLowerCase () == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	//public static function loadBitmapData(id:String, handler:BitmapData -> Void, useCache:Bool = true):BitmapData
	//{
		//return null;
	//}
	//
	//
	//public static function loadBytes(id:String, handler:ByteArray -> Void):ByteArray
	//{	
		//return null;
	//}
	//
	//
	//public static function loadText(id:String, handler:String -> Void):String
	//{
		//return null;
	//}
	
	
}