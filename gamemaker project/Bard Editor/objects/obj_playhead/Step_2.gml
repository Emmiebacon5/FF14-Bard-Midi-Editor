/// @description Insert description here
// You can write your code in this editor
collision_line_list(x,y,x,y+10000,obj_Noteobject,false,false,collisions2,false)

for(var i = 0; i < ds_list_size(collisions2); i ++){
	var obj = ds_list_find_value(collisions2,i)
	if(obj.isplaying == false and playing){
		rtmidi_send_message(obj.hex1,obj.hex2,100)
		obj.isplaying = true;
		with(obj){
			alarm_set(0,duration)
		}
	}
}
ds_list_clear(collisions2)