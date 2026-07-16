/// @description Insert description here
// You can write your code in this editor
if(ds_list_size(collisions) != 0){
for (var i = 0; i < ds_list_size(collisions); i++){
		var obj = ds_list_find_value(collisions,i)
		if(obj.isplaying){
			rtmidi_send_message(obj.hex1-16,obj.hex2,0)
		}
	}
}
ds_list_clear(collisions)
//if(isplaying and !sentoff){
//	if(!collision_rectangle(x,y,x+duration,y+10,obj_playhead,false,false)){
	
//		rtmidi_send_message(hex1-16,hex2,0)
//		sentoff = true
//	}
//}