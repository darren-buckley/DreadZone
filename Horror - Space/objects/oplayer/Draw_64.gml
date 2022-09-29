draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_font(fntHorrorsmall);
draw_text(10,15,"STAMINA");
draw_healthbar(10,35,100,45,(stamina / maxStamina) * 100,-1,c_blue,c_blue,180,-1,true);


if(displayMessage) {
	global.wait = true
	draw_set_font(fntHorror);
	draw_set_halign(fa_center);
	draw_sprite_ext(sBox,0,display_get_gui_width() / 2, display_get_gui_height() / 2,0.5 + string_length(_message) + 32,0.75,0,c_white,0.75);
	draw_set_color(c_white);
	draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + 6,_message);
}
else {
	if(!instance_exists(oMessageManager)) global.wait = false;
}

if(aquire) {
	if(!collect) {
		collect = true;
		audio_play_sound(sndItem,1,false);
		var inst = instance_create_depth(x, y,-10,oAquiredMessage);
	}
	draw_set_font(fntHorror);
	draw_set_halign(fa_center);
	draw_text_ext_color(display_get_gui_width() - 170,20,"Aquired - " + item[itemNumber],32,500,c_yellow,c_yellow,c_yellow,c_yellow,alpha);
	if(alpha > 0) alpha -=0.0075;
	else {
		collect = false;
		alpha = 1;
		yy = 0;
		aquire = false;
	}
	
}


draw_sprite_stretched(sHeart,life,10,55,34,34);