var _player = global.player;

if(!_player.currentlyDying) {
	if(_player.realmCurrent == id) {
		if(mouse_check_button_released(mb_left)) {
			var _bossCount = array_length(bosses);
			var _directionArray = [90, 40, 140];
			
			for(var _bossI = 0; _bossI < _bossCount; _bossI++) {
				
				var _bossX = x + dcos(_directionArray[_bossI]) * bossDist;
				var _bossY = y - dsin(_directionArray[_bossI]) * bossDist;
				
				if(point_distance(_bossX, _bossY, mouse_x, mouse_y) < bossHitRange) {
					
					var _boss = bosses[_bossI];
					_boss.scaleShake += .7;
					audio_play_sound(choose(snd_hit, snd_hit2, snd_hit3), 0, 0);
					if(_boss.Health > 0) {
						_boss.Health--;
						part_particles_create(global.sys, mouse_x, mouse_y, global.bloodPart, irandom_range(3, 7));
						
						if(!global.player.godmode) {
							if(irandom(40) == 0) {
								global.player.die();
							}
						}
						
						if(_boss.Health <= 0) {
							_boss.image = 1; // set sprite and keep animation if you want i guess?
							global.bossKillsArray[_boss.index] = 1;
							part_particles_create(global.sys, mouse_x, mouse_y, global.bloodPart, irandom_range(60, 80));
							audio_play_sound(snd_deathSquish, 0, 0);
						}
					}
					
				}
			}
		}
	}
}