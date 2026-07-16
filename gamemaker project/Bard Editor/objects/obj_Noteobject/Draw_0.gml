/// @description Insert description here
// You can write your code in this editor

switch (channelnumber){
	case 0:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_red,100)
		break;
	case 1:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_blue,100)
		break;
	case 2:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_lime,100)
		break;
	case 3:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_yellow,100)
		break;
	case 4:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_fuchsia,100)
		break;
	case 5:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,#9999FF,100)
		break;
	case 6:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_teal,100)
		break;
	case 7:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_orange,100)
		break;
	case 8:
		draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,#006600,100)
		break;
}

if(channelnumber > 8){
	draw_sprite_ext(Sprite1,0,x,y,image_xscale,image_yscale,0,c_white,100)
}