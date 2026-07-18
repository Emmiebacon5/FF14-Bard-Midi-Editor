// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//THIS IS RESOURCE INTENSIVE AND WILL HANG FOR A LITTLE.
//PROBABLY SHOULD CHANGE THIS SO THAT WE ONLY CHECK RELEVANT NOTES
function check_for_warnings(){
	obj_warning_checker.totalwarnings = 0
	obj_warning_checker.overlapnotes = 0
	obj_warning_checker.oorchannels = 0
	with(obj_Noteobject){
		//Is our start tick colliding with another note on the same channel? if so, its an overlap.
		var col = collision_point(tick,y+1,obj_Noteobject,false,true)
		if(col){
			if (col.channelnumber == channelnumber){
				obj_warning_checker.totalwarnings ++
				obj_warning_checker.overlapnotes ++
			}
		}
		//Is our channel more than 8 (7, index from 0)? This is more bards than possible, throw warning
		if(channelnumber > 7){
			obj_warning_checker.totalwarnings ++
			obj_warning_checker.oorchannels ++
		}
	}
}