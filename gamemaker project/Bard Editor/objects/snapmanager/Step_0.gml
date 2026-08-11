/// @description Insert description here
// You can write your code in this editor


//ds_list_clear(snappositions)
//var seconds = 0
//var temptempo = 60
//var lasttempotick = 0
//var actualfuckingtpq = midimanager.actualfuckingtpq


//switch (midimanager.currentsnap){
////none
//	case 0:
//	//do zilch
//	break;
	
////beat
//case 1:

//	for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i +=(temptempo/ (temptempo*(1/actualfuckingtpq)))){
//	var hit = collision_line(i,1910,lasttempotick + 65,1910,obj_tempo_change,false,false)
//	if (hit){
//		temptempo = hit.storedtempo
//		lasttempotick = hit.tick
//	}
//		draw_line_colour(i,0,i,2300,c_grey,c_grey)
//		ds_list_add(snappositions,i)
//	}
//	break;

////1/4
//case 2:
//	for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i +=(temptempo/ (temptempo*(4/actualfuckingtpq)))){
//	var hit = collision_line(i,1910,lasttempotick + 65,1910,obj_tempo_change,false,false)
//	if (hit){
//		temptempo = hit.storedtempo
//		lasttempotick = hit.tick
//	}
//		draw_line_colour(i,0,i,2300,c_grey,c_grey)
//		ds_list_add(snappositions,i)
//	}
//	break;

////1/8
//case 3:
//	for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i +=(temptempo/ (temptempo*(8/actualfuckingtpq)))){
//	var hit = collision_line(i,1910,lasttempotick + 65,1910,obj_tempo_change,false,false)
//	if (hit){
//		temptempo = hit.storedtempo
//		lasttempotick = hit.tick
//	}
//		draw_line_colour(i,0,i,2300,c_grey,c_grey)
//		ds_list_add(snappositions,i)
//	}
//	break;

////1/16
//case 4:
//	for(var i = 0; i < camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]); i +=(temptempo/ (temptempo*(16/actualfuckingtpq)))){
//	var hit = collision_line(i,1910,lasttempotick + 65,1910,obj_tempo_change,false,false)
//	if (hit){
//		temptempo = hit.storedtempo
//		lasttempotick = hit.tick
//	}
//		draw_line_colour(i,0,i,2300,c_grey,c_grey)
//		ds_list_add(snappositions,i)
//	}
//	break;
//}