draw_set_font(fntHorror);
draw_sprite_ext(sBox,0,display_get_gui_width() / 2, display_get_gui_height() / 2,1.1,1.1,0,c_white,0.75);
draw_set_color(c_yellow);
var padding = 16;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var stringHeight = string_height(text[pos]);
draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 - 75,ConvoNames[name]);
draw_set_color(c_white);
draw_text_ext(display_get_gui_width() / 2, display_get_gui_height() / 2 + 6,text[pos],stringHeight,width);


