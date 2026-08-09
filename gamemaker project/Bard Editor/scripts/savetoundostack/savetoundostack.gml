// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function savetoundostack(ctrlzmode = false){
	if(!ctrlzmode){
		//delete oldest stack if bigger than 10
		global.stackposition += 1
		if(global.stackposition > 9){
			ds_list_delete(global.undoredostack,0)
			ds_list_add(global.undoredostack,ds_list_create())
			global.stackposition = 9
		}
	}
	
	ds_list_clear(ds_list_find_value(global.undoredostack,global.stackposition))
	with (obj_Noteobject){
		ds_list_add(ds_list_find_value(global.undoredostack,global.stackposition),myhash)
	
	}

	
}