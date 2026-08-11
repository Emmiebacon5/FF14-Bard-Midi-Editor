/// @description Insert description here
// You can write your code in this editor
var shift = keyboard_check(vk_shift)
for (var i = 0; i < ds_list_size(currently_selected_notes); i++){
	var obj = ds_list_find_value(currently_selected_notes,i)
	if(shift){obj.hex2 -= 12;}
	else{obj.hex2 -= 1;}
	
	alarm_set(1,1)
	if(i = 0){rtmidi_send_message(obj.hex1,obj.hex2,100)}
	
	with(obj){
		myhash = string(tick) + "," + string(duration) + "," + string(hex1) + "," + string(hex2) + "," + string(hex3) + "," + string(channelnumber)
	}
}