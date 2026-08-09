/// @description Insert description here
// You can write your code in this editor
var shift = keyboard_check(vk_shift)
for (var i = 0; i < ds_list_size(currently_selected_notes); i++){
	if(shift){ds_list_find_value(currently_selected_notes,i).hex2 += 12;}
	else{ds_list_find_value(currently_selected_notes,i).hex2 += 1;}
	with(ds_list_find_value(currently_selected_notes,i)){
		myhash = string(tick) + "," + string(duration) + "," + string(hex1) + "," + string(hex2) + "," + string(hex3) + "," + string(channelnumber)
	}
}
