/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_filedropper)){
	instance_create_layer(-2000,-2000,"Instances_1",obj_filedropper)
	audio_play_sound(FFXIV_Switch_Target,1,0)
}
else if(instance_exists(obj_filedropper)){
	with(obj_filedropper){instance_destroy();audio_play_sound(FFXIV_Close_Window,1,0)}
}

check_for_warnings()