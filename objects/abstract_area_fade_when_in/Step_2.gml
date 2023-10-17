
target_alpha = player.last_area == show_when_area_is ? 1 : 0;
image_alpha = lerp(image_alpha, target_alpha, fade_speed);