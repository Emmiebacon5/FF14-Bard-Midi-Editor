/// @description Insert description here
// You can write your code in this editor
var shiftdown = keyboard_check(vk_shift)

if (drawselectbox){
	ds_list_clear(boxhitnotes)
	collision_rectangle_list(boxstartx,boxstarty,mouse_x,mouse_y,obj_Noteobject,true,true,boxhitnotes,false)
	drawselectbox = false;
	boxstartx = 0
	boxstarty = 0
}

if(ds_list_size(boxhitnotes) != 0 and !shiftdown){
	ds_list_clear(currently_selected_notes)
	ds_list_copy(currently_selected_notes,boxhitnotes)
	audio_play_sound(FFXIV_Switch_Target,1,0)
}
else if(ds_list_size(boxhitnotes) != 0 and shiftdown){
	for(var i = 0; i < ds_list_size(boxhitnotes);i++){
		ds_list_add(currently_selected_notes,ds_list_find_value(boxhitnotes,i));
	}
	audio_play_sound(FFXIV_Switch_Target,1,0)
}
else{if(ds_list_size(currently_selected_notes) > 0){audio_play_sound(FFXIV_Untarget,1,0)};ds_list_clear(currently_selected_notes)}

image_xscale = 21.5 * camera_get_view_width(view_camera[0])/1920