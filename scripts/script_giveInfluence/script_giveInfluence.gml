function script_giveInfluence(xx, yy, strength, radius, influenceType, colorSet = c_white) {
	with(obj_realm) {
		var _distFalloff = 1 - min(point_distance(xx, yy, x, y) / radius, 1);
		var _value = sqr(influenceValue - strength) * _distFalloff;
		
		script_message(x, y, _value, 120, colorSet);
	}
}