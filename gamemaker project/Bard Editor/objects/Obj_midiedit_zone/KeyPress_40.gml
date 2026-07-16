/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < ds_list_size(currently_selected_notes); i++){
	ds_list_find_value(currently_selected_notes,i).hex2 -= 1;
}