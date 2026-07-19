// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//This WAS resource intensive, but now it uses fake concurrency to check notes over time.
function check_for_warnings(){
	if(obj_warning_checker.noteschecked == 0){
		obj_warning_checker.oldtotalwarnings = obj_warning_checker.totalwarnings
		obj_warning_checker.oldoverlapnotes = obj_warning_checker.overlapnotes
		obj_warning_checker.oldoorchannels = obj_warning_checker.oorchannels
		obj_warning_checker.totalwarnings = 0
		obj_warning_checker.overlapnotes = 0
		obj_warning_checker.oorchannels = 0
		with(obj_Noteobject){ //add all notes to an array
			ds_list_add(global.warningchecknotes,self)
		}
	}
	
	//go through some entries in the array
	var weneedtobreak = false
	for(var i = obj_warning_checker.noteschecked;i < ds_list_size(global.warningchecknotes); i ++){
		if(weneedtobreak){
			break;
		}
		with(ds_list_find_value(global.warningchecknotes,i)){
			obj_warning_checker.noteschecked ++;
			
			//Is our start tick colliding with another note on the same channel? if so, its an overlap.
			var col = collision_point(tick,y,obj_Noteobject,false,true)
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
			
			
			//pause checking every 100 objects to fake concurrency :3
			if(obj_warning_checker.noteschecked mod 100 == 0){
				weneedtobreak = true;
			}
			
		}
	}
	if(obj_warning_checker.noteschecked == ds_list_size(global.warningchecknotes)){
		ds_list_clear(global.warningchecknotes)
		obj_warning_checker.noteschecked = 0
		
	}
}
