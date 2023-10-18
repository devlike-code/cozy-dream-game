/*
	NONE = 0,
	SEED = 1,
	CROP = 2,
	TOOL = 3,
*/

new Item("tomato", spr_crop_tomato, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY TOMATO!");
		return true;
	});

new Item("tomato seed", spr_seed_tomato, item_category.SEED)
	.has_description("Plants tomato crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.TOMATO);
				show_debug_message("TOMATO SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});

new Item("artichoke", spr_crop_artichoke, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY ARTICHOKE!");
		return true;
	});

new Item("artichoke seed", spr_seed_artichoke, item_category.SEED)
	.has_description("Plants artichoke crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.ARTICHOKE);
				show_debug_message("ARTICHOKE SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});

new Item("corn", spr_crop_corn, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY CORN!");
		return true;
	});

new Item("corn seed", spr_seed_corn, item_category.SEED)
	.has_description("Plants corn crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.CORN);
				show_debug_message("CORN SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});
	
	new Item("carrot", spr_crop_carrot, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY CARROT!");
		return true;
	});

new Item("carrot seed", spr_seed_carrot, item_category.SEED)
	.has_description("Plants carrot crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.CARROT);
				show_debug_message("CARROT SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});
	
	new Item("gourd", spr_crop_gourd, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY GOURD!");
		return true;
	});

new Item("gourd seed", spr_seed_gourd, item_category.SEED)
	.has_description("Plants gourd crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.GOURD);
				show_debug_message("GOURD SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});
	
	new Item("pepper", spr_crop_pepper, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY PEPPER!");
		return true;
	});

new Item("pepper seed", spr_seed_pepper, item_category.SEED)
	.has_description("Plants pepper crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.PEPPER);
				show_debug_message("PEPPER SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});
	
	new Item("potato", spr_crop_potato, item_category.CROP)
	.spend_when_used()
	.has_description("+10 Health")
	.do_when_used(function(_user) {
		show_debug_message("YUMMY POTATO!");
		return true;
	});

new Item("potato seed", spr_seed_potato, item_category.SEED)
	.has_description("Plants potato crop")
	.do_when_used(function(_user) {
		var pos = _user.grid_target;
		if crops_can_be_planted_on(pos) {
			if !crop_fields.has_crop_at(pos.x, pos.y) {
				crop_fields.add_crop_at(pos.x, pos.y, crops.POTATO);
				show_debug_message("POTATO SEED IN GROUND!");
				return true;
			}
		}
		
		return false;
	});