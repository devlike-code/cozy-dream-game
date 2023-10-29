
self.layout = new CharLayout("test", 64, 64)
	.add_action("cast", 7)
	.add_action("tool", 8)
	.add_action("walk", 9)
	.add_action("slash", 6)
	.add_action("shoot", 13)
	;

self.bases = new CharLayers(char_layout_layer.BASE)
	.add_variant("female_skin1", spr_base_female_1)
	.add_variant("female_skin2", spr_base_female_2)
	.add_variant("female_skin3", spr_base_female_3)
	.add_variant("female_skin4", spr_base_female_4)
	.add_variant("female_skin5", spr_base_female_5)
	//.add_variant("male_skin1", spr_base_male_1)
	//.add_variant("male_skin2", spr_base_male_2)
	//.add_variant("male_skin3", spr_base_male_3)
	//.add_variant("male_skin4", spr_base_male_4)
	//.add_variant("male_skin5", spr_base_male_5)
	;

self.torso = new CharLayers(char_layout_layer.TORSO)
	.add_variant("empty", spr_char_empty)
	.add_variant("female_sleeveless_red", spr_female_torso_sleeveless_red)
	.add_variant("female_sleeveless_white", spr_female_torso_sleeveless_white)
	//.add_variant("male_top_brown", spr_male_torso_top_brown)
	//.add_variant("male_shirt_white", spr_male_torso_shirt_white)
	;
	
self.feet = new CharLayers(char_layout_layer.FEET)
	.add_variant("empty", spr_char_empty)
	.add_variant("female_boots_black", spr_female_feet_boots_black)
	.add_variant("female_longboots_brown", spr_female_feet_longboots_brown)
	//.add_variant("male_shoes_black", spr_male_feet_shoes_black)
	//.add_variant("male_shoes_brown", spr_male_feet_shoes_brown)
	;

self.legs = new CharLayers(char_layout_layer.LEGS)
	.add_variant("empty", spr_char_empty)
	.add_variant("female_pants_magenta", spr_female_legs_pants_magenta)
	.add_variant("female_pants_teal", spr_female_legs_pants_teal)
	//.add_variant("male_pants_green", spr_male_legs_pants_green)
	//.add_variant("male_pants_teal", spr_male_legs_pants_teal)
	;

self.hair = new CharLayers(char_layout_layer.HAIR)
	.add_variant("empty", spr_char_empty)
	.add_variant("female_pixie_blonde", spr_female_hair_pixie_blonde)
	.add_variant("female_ponytail_raven", spr_female_hair_ponytail_raven)
	//.add_variant("male_bedhead_pink", spr_male_hair_bedhead_pink)
	//.add_variant("male_messy_raven", spr_male_hair_messy_raven)
	;

self.tools = new CharLayers(char_layout_layer.TOOL)
	.add_variant("empty", spr_char_empty)
	.add_variant("tool_hoe", spr_base_tool_hoe)
	;