function script_createBoss(index) {
	var _boss = {
		healthMax : 10,
		Health : 10,
		sprite : -1,
		image : 0,
		scale : 1,
		fightable : true,
		index : 0,
		scaleShake : 1,
		flip : choose(-1, 1),
	}
	
	if(index == 1) {
		with(_boss) {
			sprite = spr_bossNightVegas;
		}
	} else if(index == 2) {
		with(_boss) {
			sprite = spr_bossPinkMass;
		}
	} else if(index == 3) {
		with(_boss) {
			sprite = spr_bossGro;
		}
	} else if(index == 4) {
		with(_boss) {
			sprite = spr_bossCreeper;
		}
	} else if(index == 5) {
		with(_boss) {
			sprite = spr_bossNightVegas;
		}
	} else if(index == 6) {
		with(_boss) {
			sprite = spr_bossPinkMass;
		}
	} else if(index == 7) {
		with(_boss) {
			sprite = spr_bossNightVegas;
		}
	} else if(index == 8) {
		with(_boss) {
			sprite = spr_bossPinkMass;
		}
	} else if(index == 9) {
		with(_boss) {
			sprite = spr_bossNightVegas;
		}
	} else if(index == 10) {
		with(_boss) {
			sprite = spr_bossPinkMass;
		}
	} else if(index == 11) {
		with(_boss) {
			sprite = spr_bossGro;
		}
	} else if(index == 12) {
		with(_boss) {
			sprite = spr_bossCreeper;
		}
	}
	
	_boss.index = index;
	
	return _boss;
}