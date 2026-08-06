/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("Z"))){
	if(global.stackposition > 0){
		//this makes sense trust
		if (global.stackposition == 9){
			savetoundostack()
		
			global.stackposition --
			global.stackposition --
			comparestack()
		}
		else if(ds_list_size(ds_list_find_value(global.undoredostack,global.stackposition + 1)) != 0){
			global.stackposition --
			comparestack()
		}
		else if(ds_list_size(ds_list_find_value(global.undoredostack,global.stackposition + 1)) == 0){
			savetoundostack()
		
			global.stackposition --
			global.stackposition --
			comparestack()
		}

	}
}
if(keyboard_check_pressed(ord("Y"))){
	if(global.stackposition < 9){
		var size = ds_list_size(ds_list_find_value(global.undoredostack,global.stackposition + 1))
		if(size != 0){
			global.stackposition ++
			comparestack()
		}
	}
}

