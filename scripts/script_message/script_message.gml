function script_message(xx, yy, text, duration, colorSet){
	var _msg = instance_create_depth(xx, yy, -5000, obj_textMarker);
	_msg.text = text;
	_msg.duration = duration;
	_msg.color = colorSet;
	
	return _msg;
}