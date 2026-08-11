/// @description Insert description here
// You can write your code in this editor

//Undo stack debug
//for (i = 0; i < 10;i ++){
//	draw_text_color(64 + 50*i,500,string(i),c_white,c_white,c_white,c_white,100)
//}
//draw_text_color(64 + 50*global.stackposition,400,string(global.stackposition),c_white,c_white,c_white,c_white,100)

//draw_text_color(64,400,string(ds_list_size(visiblenotelist)),c_white,c_white,c_white,c_white,100)

switch currentsnap{
	case 0:
	draw_text_transformed(64, 670, "Current Snap: None",1,1,0)
	break;
	case 1:
	draw_text_transformed(64, 670, "Current Snap: Beat",1,1,0)
	break;
	case 2:
	draw_text_transformed(64, 670, "Current Snap: 1/4",1,1,0)
	break;
	case 3:
	draw_text_transformed(64, 670, "Current Snap: 1/8",1,1,0)
	break;
	case 4:
	draw_text_transformed(64, 670, "Current Snap: 1/16",1,1,0)
	break;
}
