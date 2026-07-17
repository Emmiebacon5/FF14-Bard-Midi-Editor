/// @description Insert description here
// You can write your code in this editor


//draw seconds bar at top of screen thingie
depth = 1
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),+camera_get_view_y(view_camera[0])+100*camera_get_view_height(view_camera[0])/1080 ,c_grey,c_grey,c_grey,c_grey,false)
var seconds = 0
for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i += (TPQ/60)*(tickspersecond/ (TPQ/60))){
		draw_line_colour(i,0,i,2300,c_black,c_black)
		var timersecs = (seconds mod 60 < 10) ? "0" + string(seconds mod 60) : string(seconds mod 60);
		draw_text_transformed(i,camera_get_view_y(view_camera[0])+50*camera_get_view_height(view_camera[0])/1080,string(seconds div 60) + ":" + timersecs,1 * camera_get_view_width(view_camera[0])/1920,1*camera_get_view_height(view_camera[0])/1080,0)
		seconds++
}


