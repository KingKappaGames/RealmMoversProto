image_angle += 5;

draw_circle_color(x, y, 31, drawColor, drawColor, false);

draw_self();

draw_sprite_ext(spr_realmOver, 0, x, y, 1, 1, -image_angle, c_white, .8);

var _bossCount = array_length(bosses);
var _directionArray = [90, 40, 140];
for(var _bossI = 0; _bossI < _bossCount; _bossI++) {
	
	var _bossX = x + dcos(_directionArray[_bossI]) * bossDist;
	var _bossY = y - dsin(_directionArray[_bossI]) * bossDist;

	var _boss = bosses[_bossI];
	
	var _shake = _boss.scaleShake;
	var _shakeScaleX = _shake * dsin(current_time / (10 - _shake * 3.5)) * .2 + .8;
	var _shakeScaleY = 1 + (1 - _shakeScaleX);
	_boss.scaleShake = lerp(_shake, 1, .055);
	
	var _scale = _boss.scale * ((_boss.Health / _boss.healthMax) * .4) + .6;
	draw_sprite_ext(_boss.sprite, _boss.image, _bossX, _bossY, _shakeScaleX * _scale * _boss.flip, _shakeScaleY * _scale, 0, c_white, 1);
}



if(questState == 1) {
	draw_sprite_ext(questSprite, 0, x, y, 1, 1, 0, c_ltgrey, .4);
} else {
	draw_sprite_ext(questSprite, 0, x, y, 1, 1, 0, c_white, 1);
}


draw_set_color(c_black);
draw_set_alpha(.5);
if(connectionUp != noone) {
	draw_arrow( x, y - 30, lerp(x, connectionUp.x, .5), lerp(y, connectionUp.y, .5), 8);
}

if(connectionDown != noone) {
	draw_arrow( x, y + 30, lerp(x, connectionDown.x, .5), lerp(y, connectionDown.y, .5), 8);
}

if(connectionRight != noone) {
	draw_arrow( x + 30, y, lerp(x, connectionRight.x, .5), lerp(y, connectionRight.y, .5), 8);
}

if(connectionLeft != noone) {
	draw_arrow( x - 30, y, lerp(x, connectionLeft.x, .5), lerp(y, connectionLeft.y, .5), 8);
}
draw_set_alpha(1);
draw_set_color(c_white);

for(var _i = array_length(deathConnection) - 1; _i >= 0; _i--) {
	var _connection = deathConnection[_i];
	
	draw_arrow(x, y, lerp(x, _connection.x, .12), lerp(y, _connection.y, .12), 5);
}

//draw_text_transformed_color(x, y - 50, id, .5, .5, 0, c_black, c_black, c_black, c_black, 1);