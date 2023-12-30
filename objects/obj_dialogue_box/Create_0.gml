/// @description 


// Keep track of where to draw camera relative things
self.x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
self.y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);



self.current_npc_interacting_with = -1;
// If a dialogue box is created then I have to assume that current npc is set for the dialogue

self.draw_next_text = false;
self.draw_text_cooldown = 20;
	
self.text_to_display = "";
self.current_char_index = 0;
self.chars_to_display = 0;
self.partial_text = "";
self.display_speed = 1;
self.text_offset_x = self.x - 230;
self.text_offset_y = self.y - 40;

// Track the text drawing
t = 0;

