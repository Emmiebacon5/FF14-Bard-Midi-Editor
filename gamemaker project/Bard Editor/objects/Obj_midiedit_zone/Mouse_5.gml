/// @description Insert description here
// You can write your code in this editor
if(boxstartx == 0){
	boxstartx = mouse_x
	//snap
	if(midimanager.currentsnap != snapmode.none){
		var closestsnap = 99999999
		var snappos = 0
		for (var i = 0; i < ds_list_size(snapmanager.snappositions); i++){
			if (abs(boxstartx - ds_list_find_value(snapmanager.snappositions,i)) < closestsnap){
				closestsnap = abs(boxstartx - ds_list_find_value(snapmanager.snappositions,i))
				snappos = ds_list_find_value(snapmanager.snappositions,i)
			}
		}
		boxstartx = snappos
	}
	boxstarty = floor(mouse_y / 10) * 10
	drawnewnote = true;
	image_xscale = 30.5 * camera_get_view_width(view_camera[0])/1920
}