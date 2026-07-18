/// @description Insert description here
// You can write your code in this editor

if (playing == true){
	camera_set_view_border(view_camera[0],1200,2000)
	obj_cameradolly.x = x+50
	//x = x + the BPS of the song (TPQ/60)*(the amount of ticks that pass in 1 second((delta_time / 1000000))
	//let it be known that I AM A MOTHER FUCKING GENIUS!! NDUIWAOGBDYUWHAJGIBHDYIUWA 
	//AAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH!!!!!!!!!!!
	//HOLY SHITTTTTTT THIS WORKS NOWWWW!
	// SOOO MUCH EXPERIMENTING, SO MUCH TRIAL AND ERROR!
	//x = x + (midimanager.TPQ/60)*(midimanager.tickspersecond/ (midimanager.TPQ/60)*(delta_time/1000000))
	
	
	
	// 18/07/2026 - Emmie
	//after figuring out what the difference between tempo and tpq is... this is... SO much more reasonable code.
	//This is what it should have been. Beats per second/Ticks per beat.... obviously.
	//how the FUCK the other code worked considering what i was doing is BEYOND me.
	x = x + (midimanager.tempo/60) * midimanager.actualfuckingtpq * (delta_time/1000000)

}
else{
	camera_set_view_target(view_camera[0],obj_cameradolly)
	camera_set_view_border(view_camera[0],2000,2000)
}
