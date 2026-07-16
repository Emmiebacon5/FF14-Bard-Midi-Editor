/// @description Insert description here
// You can write your code in this editor
//if(isplaying and !sentoff){
//	if(!collision_rectangle(x,y,x+duration,y+10,obj_playhead,false,false)){
//		rtmidi_send_message(hex1-16,hex2,0)
//		sentoff = true
//	}
//}

if(x+duration <= obj_playhead.x and sentoff = false){
	sentoff = true
	ds_list_add(obj_playhead.collisions,self)
}