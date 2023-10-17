//Verbs that control motion of Input's device-agnostic cursor
//This is primarily used for gamepad input but can also be used for keyboard input too
#macro INPUT_CURSOR_VERB_UP     "inventory_up"
#macro INPUT_CURSOR_VERB_DOWN   "inventory_down"
#macro INPUT_CURSOR_VERB_LEFT   "inventory_left"
#macro INPUT_CURSOR_VERB_RIGHT  "inventory_right"

//The default speed for cursors when the game boots up
//This can be changed with input_cursor_speed_set()
#macro INPUT_CURSOR_START_SPEED  5

//Cursor movement exponent. This is applied when using keyboard and gamepad controls
#macro INPUT_CURSOR_EXPONENT  1
