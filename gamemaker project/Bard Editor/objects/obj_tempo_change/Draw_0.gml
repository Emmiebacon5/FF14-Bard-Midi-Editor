/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_colour(c_black)
if(editing){
	draw_text(x+64,y,"Curr tempo: " + string(storedtempo))
	draw_text(x+64,y+64,"New tempo: " + keyboard_string)
}
draw_set_colour(c_white)