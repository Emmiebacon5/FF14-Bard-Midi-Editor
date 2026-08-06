/// @description Insert description here
// You can write your code in this editor
if(ds_list_size(currently_selected_notes) != 0){
	savetoundostack()
	for(var i = global.stackposition + 1;i < ds_list_size(global.undoredostack);i++){
		ds_list_clear(ds_list_find_value(global.undoredostack,i))//zero out everything in the future
	}
}

for (var i = 0; i < ds_list_size(currently_selected_notes);i++){
	with(ds_list_find_value(currently_selected_notes,i)){
		instance_destroy()
		}
}
ds_list_clear(currently_selected_notes)