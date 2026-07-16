/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(Sprite10,0,0,0,view_get_wport(0),view_get_hport(0),0,c_white,100)
draw_set_halign(fa_center)
draw_text_transformed(700,340,"loading...",2,2,0)
draw_text_transformed(700,540,tooltiptext,1.5,1.5,0)

if (tooltiptext == "Yo i heard you're doing a cutscene, can i join in?"){
	draw_sprite_ext(wuk_catto,0,0,500,0.5,0.5,0,c_white,100)
}
draw_set_halign(fa_left)
