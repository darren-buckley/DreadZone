// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function callFade(){
	
	if(!instance_exists(oFade)){
		var fadeSquare = instance_create_depth(0,0,-100000,oFade);
		fadeSquare.image_xscale = room_width;
		fadeSquare.image_yscale = room_height;			
	}

}