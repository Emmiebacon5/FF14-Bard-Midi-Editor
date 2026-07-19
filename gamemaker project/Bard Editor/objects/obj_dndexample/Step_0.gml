
var controldown = keyboard_check(vk_control)
var keyOdown = keyboard_check_pressed(ord("O"))

if(controldown and keyOdown and !instance_exists(obj_filedropper)){
	instance_create_layer(-2000,-2000,"Instances_1",obj_filedropper)
	audio_play_sound(FFXIV_Switch_Target,1,0)
}
else if(controldown and keyOdown and instance_exists(obj_filedropper)){
	with(obj_filedropper){instance_destroy();audio_play_sound(FFXIV_Close_Window,1,0)}
}
if(instance_exists(obj_filedropper)){
	if (obj_filedropper.file_dnd_filelist != ""){
		//start load screen
		if(!instance_exists(Loadingscreen)){instance_create_layer(0,0,"Instances_1",Loadingscreen); exit}
		
		var size = 99999999;
		var buffer = buffer_create(size * buffer_sizeof(buffer_s32), buffer_fixed, 1);
	
		//while (buffer_tell(buffer) < buffer_get_size(buffer)){
		//	buffer_write(buffer, buffer_s32, 0);
		//}
		show_debug_message(buffer_get_address(buffer))
		var success = loadmidifile(obj_filedropper.file_dnd_filelist, buffer_get_address(buffer));
		if(success != 1){
			debug_event("Something has gone HORRIBLY WRONG PANIC!!!!!!!!!!!!!!!!")
			with(obj_filedropper){instance_destroy()}
			with(Loadingscreen){instance_destroy()}
			audio_play_sound(FFXIV_Notification,1,0)
			ds_list_clear(global.filedata)
			buffer_delete(buffer)
			exit
		}
		var data = 0
		buffer_seek(buffer, buffer_seek_start,0)
		ds_list_clear(global.filedata)
		while (buffer_tell(buffer) < buffer_get_size(buffer)){
			data = buffer_read(buffer,buffer_s32)
			if (data != -21){
				ds_list_add(global.filedata,data)
			}
			else{
				break;
			}
		}
	
		with(obj_Noteobject){
			instance_destroy()
		}
		with(obj_tempo_change){
			instance_destroy()
		}
		with(obj_program_change){
			instance_destroy()
		}

		Script2()
		window_set_caption("Bard Editor - " + string(obj_filedropper.file_dnd_filelist));
		with(obj_filedropper){instance_destroy()}
		with(Loadingscreen){instance_destroy()}
		audio_play_sound(FFXIV_Notification,1,0)
		ds_list_clear(global.filedata)
		buffer_delete(buffer)
		
	}
}