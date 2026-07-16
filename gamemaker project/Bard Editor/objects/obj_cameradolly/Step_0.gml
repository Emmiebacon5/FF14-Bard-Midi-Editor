/// @description Insert description here
// You can write your code in this editor
if(x <= 0){x = 1}
if(x > room_width){x = room_width}
if(y > room_height){y = room_height}
if(y <= 0){y = 1}
if(obj_playhead.playing == true){
	x = obj_playhead.x;
}

var ctrldown = keyboard_check(vk_control);
var mwheeldown = mouse_wheel_down()
var mwheelup = mouse_wheel_up()

//zoom controls
var zoomspeed = 50
if(ctrldown and mwheeldown){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0])-zoomspeed*5,camera_get_view_height(view_camera[0]))
}
else if (ctrldown and mwheelup){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0])+zoomspeed*5,camera_get_view_height(view_camera[0]))
}
else if (mwheeldown){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])-zoomspeed)
}
else if (mwheelup){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])+zoomspeed)
}

//clamp
if (camera_get_view_width(view_camera[0]) < 10){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0])+zoomspeed*3,camera_get_view_height(view_camera[0]))
}
if (camera_get_view_height(view_camera[0]) < 10){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])+zoomspeed)
}
if (camera_get_view_height(view_camera[0]) > 1630){
	camera_set_view_size(view_camera[0],camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])-zoomspeed)
}
camera_apply(view_camera[0])