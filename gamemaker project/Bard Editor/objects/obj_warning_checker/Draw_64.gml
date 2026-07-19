/// @description Insert description here
// You can write your code in this editor
draw_text(50,620,(oldtotalwarnings < 999) ? + oldtotalwarnings : "999+")
draw_sprite_ext(sprite_index,0,uiposx,uiposy,0,0,0,c_white,100)

if (draw_error_list){
	draw_rectangle_colour(100, 100,1200,600,c_grey,c_grey,c_grey,c_grey,false)
	draw_rectangle_colour(100, 100,1200,600,c_black,c_black,c_black,c_black,true)
	draw_text_colour(120, 100,(oldoverlapnotes == 0) ? + "You have 0 overlapping notes, Good Job!" : "You have " + string(oldoverlapnotes) + " overlapping notes!",c_black,c_black,c_black,c_black,100)
	draw_text_colour(120, 120,(oldoorchannels == 0) ? + "You have 0 notes on channels outside of the 8 bard range, Good Job!" : "You have " + string(oldoorchannels) + " notes on channels outside of the 8 bard range",c_black,c_black,c_black,c_black,100)
}