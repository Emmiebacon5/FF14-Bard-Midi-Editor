/// @description Insert description here
// You can write your code in this editor
var shiftdown = keyboard_check(vk_shift)



playing =! playing


if(shiftdown){x = mouse_x;
	with(obj_Noteobject){
	isplaying = false;
	sentoff = false;
}}

ds_list_clear(tempocols)
collision_line_list(x,1910,0,1910,obj_tempo_change,false,false,tempocols,false)
	var closesthit = 0
	var closestdist = 0
	for(var i = 0; i < ds_list_size(tempocols);i++){
		var obj = ds_list_find_value(tempocols,i)
		if (obj.x > closestdist){closestdist = obj.x; closesthit = obj;midimanager.tempo = obj.storedtempo}
	}
if(!playing){sMIDIPanic()}