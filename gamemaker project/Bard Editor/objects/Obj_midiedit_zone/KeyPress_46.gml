/// @description Insert description here
// You can write your code in this editor
if(ds_list_size(currently_selected_notes) != 0){
	savetoundostack()

}

for (var i = 0; i < ds_list_size(currently_selected_notes);i++){
	with(ds_list_find_value(currently_selected_notes,i)){
		instance_destroy()
		}
}
ds_list_clear(currently_selected_notes)