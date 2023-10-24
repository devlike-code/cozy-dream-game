// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

return {
    
    keyboard_and_mouse:
    {
		up:    input_binding_key("W"),
        down:  input_binding_key("S"),
        left:  input_binding_key("A"),
        right: input_binding_key("D"),

        inventory_up:    input_binding_key(vk_up),
        inventory_down:  input_binding_key(vk_down),
        inventory_left:  input_binding_key(vk_left),
        inventory_right: input_binding_key(vk_right),
        
        pickup:  input_binding_key(vk_space),
        tool: input_binding_key(vk_alt),
		inventory: input_binding_key(vk_tab),
        		
        //No aiming verbs since we use the mouse for that (see below for aiming verb examples)
        shoot: input_binding_key(vk_capslock),
        
        pause: input_binding_key(vk_escape),
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true)],
        down:  [input_binding_gamepad_axis(gp_axislv, false)],
        left:  [input_binding_gamepad_axis(gp_axislh, true)],
        right: [input_binding_gamepad_axis(gp_axislh, false)],
        
        pickup:  input_binding_gamepad_button(gp_face1),
        tool:  input_binding_gamepad_button(gp_face3),
		inventory: input_binding_gamepad_button(gp_select),
        
        inventory_up:    input_binding_gamepad_button(gp_padu),
        inventory_down:  input_binding_gamepad_button(gp_padd),
        inventory_left:  input_binding_gamepad_button(gp_padl),
        inventory_right: input_binding_gamepad_button(gp_padr),
        
        pause: input_binding_gamepad_button(gp_start),
    },
    
    touch:
    {
        up:    input_binding_virtual_button(),
        down:  input_binding_virtual_button(),
        left:  input_binding_virtual_button(),
        right: input_binding_virtual_button(),
		
        pickup:  input_binding_virtual_button(),
        tool: input_binding_virtual_button(),
        
        pause: input_binding_virtual_button(),
    }
    
};
