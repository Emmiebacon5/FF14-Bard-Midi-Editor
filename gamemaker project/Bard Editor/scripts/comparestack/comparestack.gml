// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function comparestack(){
	global.tempstack = ds_list_create()
	ds_list_copy(global.tempstack,ds_list_find_value(global.undoredostack,global.stackposition))
	if(ds_list_size(global.tempstack) == 0){
		exit
	}

	with(obj_Noteobject){
		var safe = false
		for (var i = 0; i < ds_list_size(global.tempstack);i++){
			if(myhash != ds_list_find_value(global.tempstack,i)){continue;}
		
			else{
				ds_list_delete(global.tempstack,i) //mark as identical
				safe = true
				break;
			}
		}
		if(!safe){instance_destroy()} //not in list, destroy
	}

	//Now that weve destroyed everything that shouldnt exist, we now need to create everything that NEEDS to exist

	for (var i = 0; i < ds_list_size(global.tempstack);i++){
		if(ds_list_find_value(global.tempstack,i) == 0){continue;} //already dealt with
		else{
			//create a new note by parsing the hash...
			var data = string_split(ds_list_find_value(global.tempstack,i), ",");
			instance_create_layer(real(data[0]),2000 - (real(data[3])*10),"Instances",obj_Noteobject,
			{
				tick: real(data[0]),
				duration: real(data[1]),
				hex1: real(data[2]),
				hex2: real(data[3]),
				hex3: real(data[4]),
				channelnumber: real(data[5])
			});
		}
	}
	ds_list_clear(global.tempstack)
}