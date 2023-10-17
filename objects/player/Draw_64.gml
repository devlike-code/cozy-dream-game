
if manager_debug.debug_on {
	scribble("[wave][rainbow](1) Base: " + string(base_index)).draw(20, 10);
	scribble("[wave][rainbow](2) Torso: " + string(torso_index)).draw(20, 30);
	scribble("[wave][rainbow](3) Feet: " + string(feet_index)).draw(20, 50);
	scribble("[wave][rainbow](4) Legs: " + string(legs_index)).draw(20, 70);
	scribble("[wave][rainbow](5) Hair: " + string(hair_index)).draw(20, 90);
	scribble("State: " + fsm.get_current_state()).draw(20, 110);
}

inventory_draw(inventory);