/// @description Insert description here
// You can write your code in this editor
if(middlestart == 0){
	middlestart = device_mouse_x_to_gui(0)
	middlestarty = device_mouse_y_to_gui(0)
	draw_cam_line = true;
}

obj_cameradolly.x +=device_mouse_x_to_gui(0)- middlestart