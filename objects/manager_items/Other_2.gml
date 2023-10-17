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
		show_debug_message("YUMMY!");
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
