/// @description Insert description here
// You can write your code in this editor
if(boxstartx == 0){
	boxstartx = mouse_x
	boxstarty = mouse_y
	drawselectbox = true;
	image_xscale = 30.5 * camera_get_view_width(view_camera[0])/1920
}