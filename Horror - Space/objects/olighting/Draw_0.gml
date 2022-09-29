if !surface_exists(surf)
    {
    var _cw = uc_get_view_width(Camera);
    var _ch = uc_get_view_height(Camera);
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
}
else
{
	if (surface_exists(surf)) {
		 var _cw = uc_get_view_width(Camera);
		 var _ch = uc_get_view_height(Camera);
		 var _cx = uc_get_view_x(Camera);
		 var _cy = uc_get_view_y(Camera);
		surface_set_target(surf);
		draw_set_color(c_black);
		draw_set_alpha(0.85)
		draw_rectangle(0, 0, _cw, _ch, 0);
		gpu_set_blendmode(bm_subtract);
		with (oLightParent) {
			
			if(enabled){
				with(oLighting) depth = 0;
				var _sw = sprite_width / 2;
				var _sh = sprite_height / 2;
		
				switch(object_index){
	
					case oPlayer:
					    draw_sprite_ext(sFlashlet, 0, x - _cx, y  - _cy, 1, 1, oLighting.rot, c_white, 1);            
					break;
				
				}
			}
	    }
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(surf, _cx, _cy);
	}

}