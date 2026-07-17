/// @description Insert description here
// You can write your code in this editor
//draw_self()

for (i = 0;i < ds_list_size(currently_selected_notes); i++){
	with(ds_list_find_value(currently_selected_notes,i)){
		draw_rectangle_colour(x,y,x+duration,y+10,#AA6C39,#AA6C39,#AA6C39,#AA6C39,false)
		draw_text(x,y,tick)
		draw_text(x,y+20,tick+duration)
	}
}
if(drawselectbox){
	draw_rectangle_colour(boxstartx,boxstarty,mouse_x,mouse_y,c_blue,c_blue,c_blue,c_blue,true)
}