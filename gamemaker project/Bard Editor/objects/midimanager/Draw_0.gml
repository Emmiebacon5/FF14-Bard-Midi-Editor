/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i += (TPQ/60)*(tickspersecond/ (TPQ/60))){
		draw_line_colour(i,0,i,2300,c_black,c_black)
}