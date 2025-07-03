x += xChange;
y += yChange;

image_angle = dsin(current_time / 10) * 30;

if(following) {
	var _playerX = global.player.x;
	var _playerY = global.player.y;
	var _playerDir = point_direction(x, y, _playerX, _playerY);
	
	xChange += dcos(_playerDir) * .12;
	yChange -= dsin(_playerDir) * .12;
	xChange *= .97;
	yChange *= .97;
	
	part_particles_create(global.sys, x + irandom_range(-11, 11), y + irandom_range(-11, 11), global.glimmerPart, 1);
	
	if(point_distance(x, y, global.player.x, global.player.y) < 18) {
		if(image_xscale >= 0) {
			image_xscale -= .2;
			image_yscale -= .2;
			repeat(12) {
				part_particles_create(global.sys, x + irandom_range(-24, 24), y + irandom_range(-24, 24), global.glimmerPart, 1);
			}
		} else {
			audio_play_sound(snd_pickup, 0, 0);
			global.questItemsArray[itemIndex] = 1;
			instance_destroy();
		}
	}
}

if(!global.player.currentlyDying) {
	if(mouse_check_button_released(mb_left)) {
		if(point_distance(x, y, mouse_x, mouse_y) < 23) {
			if(point_distance(x, y, global.player.x, global.player.y) < 160) {
				xChange = random_range(-2, 2);
				yChange = random_range(-2, 2);
				following = true;
				audio_play_sound(snd_questAttempt, 0, 0);
			}
		}
	}
}