if(currentlyDying) {
	dyingProgress += .2;
	
	if(dyingProgress < 5) {
		global.ppx.SetEffectParameter(FF_INVERT_COLORS, PP_INVERT_COLORS_INTENSITY, (dyingProgress / 5));
	} else if(dyingProgress < 40) {
		repeat(12) {
			part_particles_create(global.sys, x + irandom_range(-24, 24), y + irandom_range(-24, 24), global.glimmerPart, 1);
		}
		image_alpha = 1 - ((dyingProgress - 5) / 35);
	} else if(dyingProgress == 41) {
		audio_play_sound(snd_freakyDeathChant, 0, 0);
	} else if(dyingProgress < 80) {
		x = lerp(x, realmGoal.x, .02);
		y = lerp(y, realmGoal.y, .02);
	} else if(dyingProgress < 100) {
		image_alpha = ((dyingProgress - 80) / 20);
		repeat(1) {
			part_particles_create(global.sys, x + irandom_range(-24, 24), y + irandom_range(-24, 24), global.glimmerPart, 1);
		}
		global.ppx.SetEffectParameter(FF_INVERT_COLORS, PP_INVERT_COLORS_INTENSITY, 1 - image_alpha);
	} else {
		image_alpha = 1;
		global.ppx.SetEffectEnable(FF_INVERT_COLORS, false); // ppx
		currentlyDying = false;
		finishPath(); // not a path but whatever
	}
} else {
	if(!currentlyMoving) {
		if(keyboard_check(ord("W"))) {
			realmCurrent.moveFromRealm(moveDir.up);
		}
		if(keyboard_check(ord("S"))) {
			realmCurrent.moveFromRealm(moveDir.down);
		}
		if(keyboard_check(ord("A"))) {
			realmCurrent.moveFromRealm(moveDir.left);
		}
		if(keyboard_check(ord("D"))) {
			realmCurrent.moveFromRealm(moveDir.right);
		}
		if(keyboard_check_released(ord("E"))) {
			if(realmCurrent.questState == 0) {
				part_particles_create(global.sys, x, y, global.glimmerPart, irandom_range(4, 6));
				if(random(1) < realmCurrent.questChance) {
					realmCurrent.questState = 1;
					global.gameProgressArray[realmCurrent.questIndex] = 1;
					part_particles_create(global.sys, x, y, global.glimmerPart, irandom_range(50, 100));
					audio_play_sound(snd_questSucceed, 0, 0);
				} else {
					audio_play_sound(snd_questAttempt, 0, 0);
				}
			}
		}
	} else {
		if(path_speed < 0) {
			if(path_position <= 0) {
				finishPath();
			}
		} else {
			if(path_position >= 1) {
				finishPath();
			}
		}
		
		if(floor(image_index) == 11) {
			if(!audio_is_playing(snd_squish)) {
				audio_play_sound(snd_squish, 0, 0);
			}
		}
	}
}

camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) / 2, y - camera_get_view_height(view_camera[0]) / 2);

timer++;
if(timer % 30 == 0) {
	with(obj_mapVisual) {
		if(image_index == 0) {
			if(global.checksArray[conditionArray][conditionIndex]) {
				image_speed = 1;
			}
		}
	}
}




if(keyboard_check_released(ord("O"))) {
	global.bossKillsArray[irandom(11)] = 1;
}

if(keyboard_check_released(ord("I"))) {
	showProgressionGui = !showProgressionGui;
}

if(keyboard_check_released(ord("G"))) {
	godmode = !godmode; // whether you can die
}

if(keyboard_check_released(ord("P"))) {
	script_giveInfluence(mouse_x, mouse_y, 1, 500, 0, c_black); // whether you can die
}

if(keyboard_check_released(ord("R"))) {
	global.bossKillsArray = array_create(12);
	global.questItemsArray = array_create(12);
	global.secretPathArray = array_create(12); // bools for progression values
	global.gameProgressArray = array_create(12);
	
	global.checksArray = [global.bossKillsArray, global.questItemsArray, global.secretPathArray, global.gameProgressArray];
}

if(keyboard_check_released(ord("F"))) {
	window_set_fullscreen(!window_get_fullscreen());
}