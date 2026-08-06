


// Check for Startup file
var parcount = parameter_count()
var file_path = ""
for (var i = 1; i < parcount; i++){
	var temppar = parameter_string(i)
	if(string_ends_with(temppar,".mid")){
		file_path = parameter_string(i)
		break
	}
	
}
if (file_path == ""){exit}



//start load screen
with(Loadingscreen){tooltiptext = file_path}
var size = 99999999;
var buffer = buffer_create(size * buffer_sizeof(buffer_s32), buffer_fixed, 1);
	
//while (buffer_tell(buffer) < buffer_get_size(buffer)){
//	buffer_write(buffer, buffer_s32, 0);
//}
show_debug_message(buffer_get_address(buffer))
var success = loadmidifile(file_path, buffer_get_address(buffer));
if(success != 1){
	debug_event("Something has gone HORRIBLY WRONG PANIC!!!!!!!!!!!!!!!!")
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
window_set_caption("Bard Editor - " + string(file_path));
audio_play_sound(FFXIV_Notification,1,0)
ds_list_clear(global.filedata)
buffer_delete(buffer)
		