// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function followUI(xpos,ypos){
	y = camera_get_view_y(view_camera[0])+(ypos / camera_get_view_height(view_camera[0])/1020)
	x = camera_get_view_x(view_camera[0])+(xpos / camera_get_view_width(view_camera[0])/1920)
	image_xscale = 1 * camera_get_view_width(view_camera[0])/1920
	image_yscale = 1 * camera_get_view_height(view_camera[0])/1080
	
}