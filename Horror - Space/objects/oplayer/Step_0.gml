#macro moveleft inputdog_down("left",playerSlot)
#macro moveright inputdog_down("right",playerSlot)
#macro moveup inputdog_down("up",playerSlot)
#macro movedown inputdog_down("down",playerSlot)
#macro actionButton inputdog_pressed("action",playerSlot)
	
#region movement

	depth = -y;
	
	if(!global.wait){
		var xx = moveright - moveleft;
		var yy = movedown - moveup;
		
		hsp = xx * spd;
		vsp = yy * spd;
	
		
		if(hsp > 0) {
			if(!runwalk) sprite_index = sTrinityWalkS;
			else sprite_index = sTrinityRunS;
			image_xscale = -1;
			image_speed = 1;
		}
		else if(hsp < 0) {
			if(!runwalk) sprite_index = sTrinityWalkS;
			else sprite_index = sTrinityRunS;
			image_xscale = 1;
			image_speed = 1;
		}
		else if(vsp > 0) {
			if(!runwalk) sprite_index = sTrinityWalkD;
			else sprite_index = sTrinityRunD;
			image_xscale = 1;
			image_speed = 1;
		}
		else if(vsp < 0) {
			if(!runwalk) sprite_index = sTrinityWalkU;
			else sprite_index = sTrinityRunU;
			image_xscale = 1;
			image_speed = 1;
		}
		
		if(hsp == 0 && vsp == 0) {
			image_speed = 0;
		}
	
	
		if((hsp != 0 || vsp != 0) && keyboard_check(vk_space) && stamina > 0) {
			cd = 0;
			refil = false;
			stamina-=0.2;
			spd = run;
			if(spd > 30.5) spd = 30.5;
			runwalk = 1;
		}
		else {
			spd = 20;
			if(spd > 20) spd = 20;
			runwalk = 0;
			if(stamina <= 0) {
				wait = true;
				global.wait = true;
			}
			else {
				wait = false;
				if(stamina < maxStamina) stamina+= 0.25;
			}
		}
		
	}
	else {
		hsp = 0;
		vsp = 0;
		if(spd > 20) spd = 20;
		runwalk = 0;
	}

#endregion
	
var transition = instance_place(x, y, oTransition);

if(transition) {

	__name = transition.roomName;
	
	with(transition) {
		callFade();
	}
}

if(wait) {
	cd = min(cd + 1, 180);
	if(cd == 180){
		global.wait = false;
		refil = true;
	}
}
	
if(refil) {   
	if(stamina < maxStamina) stamina+=0.25;
	else {
		cd = 0;
		wait = false;
		refil = false;
	}
}


stamina = clamp(stamina,0,maxStamina);

var inst = instance_nearest(x,y,InteractableObject);

if(distance_to_object(inst) < 10 && actionButton) {
	displayMessage = !displayMessage
	switch(sprite_index) {
		case sTrinityWalkU:
		case sTrinityRunU:
		sprite_index = sTrinityIdle;
		image_index = 1;
		break;
		case sTrinityWalkD:
		case sTrinityRunD:
		sprite_index = sTrinityIdle;
		image_index = 0;
		break;
		case sTrinityWalkS:
		case sTrinityRunS:
		sprite_index = sTrinityIdle;
		image_index = 2;
		image_xscale *= -1;
		break;
	}
	image_speed = 0;
	_message = inst.text;
}
 
if (hit && alarm[0] <= 0) {
	if(!audio_is_playing(sndTrinHurt)) audio_play_sound(sndTrinHurt,1,false);
   alarm[0] = 0.08 * room_speed; // Flashes for 0.8 seconds before turning back to normal
}

if(life >= 4 && isDead == false) {
	if(global.wait = false){
		randomize();
		randomName = choose("SETHERED","SLAUGHTERED","INCAPACITATED","OBLITERATED","EXECUTED","IMPALED","SHREDDED");
		global.wait = true
		audio_play_sound(sndDead,1,false);
		audio_play_sound(sndDeadSound,1,false);
		isDead = true;
	}
}

if(isDead) {
	show_message("YOU WERE " + randomName);
	deadtimer = min(deadtimer + 1, 2);
	if(deadtimer == 2) {
		game_restart();
	}
}


#region collide

if(place_meeting(x + hsp, y, parSolid)) {
	while(!place_meeting(x + sign(hsp), y, parSolid)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if(place_meeting(x, y + vsp, parSolid)) {
	while(!place_meeting(x,y+sign(vsp),parSolid)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
#endregion


