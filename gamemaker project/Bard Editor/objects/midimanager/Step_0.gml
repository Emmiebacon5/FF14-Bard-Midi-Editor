/// @description Insert description here
// You can write your code in this editor


//for (var i = 0; i < ds_list_size(visiblenotelist); i ++){
//	with(ds_list_find_value(visiblenotelist,i)){
//		instance_activate_object()
//	}
//}


var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
collision_rectangle_list(_vx - 200, _vy, _vx+_vw, _vy+_vh, obj_Noteobject, true, true ,visiblenotelist,false)
draw_rectangle(_vx - 200, _vy, _vx+_vw, _vy+_vh,false)


for(var i = 0; i < ds_list_size(visiblenotelist); i++){
	with(ds_list_find_value(visiblenotelist,i)){inview = true;}
}
ds_list_clear(visiblenotelist)

