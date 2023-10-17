
function Tool(_name, _image, _action) constructor {
	name = _name;
	image = _image;
	action = _action;
	
	effect = function(_user) {
		show_debug_message("WARNING: the {0} tool's usage is not set, so it does nothing when called.");
	};
	
	static when_used = function(_func) {
		effect = _func;	
	}
	
	static use = function(_user) {
		if effect != noone {
			effect(_user);
		}
	}
}

