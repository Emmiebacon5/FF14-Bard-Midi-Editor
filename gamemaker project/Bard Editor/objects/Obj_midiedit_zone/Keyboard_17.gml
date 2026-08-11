/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("Z"))){
	if(global.stackposition > 0){
		//this makes sense trust
		if (global.stackposition == 9){
			savetoundostack(true)
			global.stackposition --
			comparestack()
		}
		else if(ds_list_size(ds_list_find_value(global.undoredostack,global.stackposition + 1)) != 0){
			savetoundostack(true)
			global.stackposition --
			comparestack()
		}
		else if(ds_list_size(ds_list_find_value(global.undoredostack,global.stackposition + 1)) == 0){
			savetoundostack(true)
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
if(keyboard_check_pressed(ord("C"))){
	ds_list_clear(copiednotes)
	for(var i = 0; i < ds_list_size(currently_selected_notes); i++){
		with(ds_list_find_value(currently_selected_notes,i)){ds_list_add(Obj_midiedit_zone.copiednotes,myhash)}
		ds_list_sort(copiednotes,true)
	}
	
}

if(keyboard_check_pressed(ord("V"))){
	if(ds_list_size(copiednotes) > 1){
		var startpos = mouse_x
		
		if(midimanager.currentsnap != snapmode.none){
			var closestsnap = 99999999
			var snappos = 0
			for (var i = 0; i < ds_list_size(snapmanager.snappositions); i++){
				if (abs(startpos - ds_list_find_value(snapmanager.snappositions,i)) < closestsnap){
					closestsnap = abs(startpos - ds_list_find_value(snapmanager.snappositions,i))
					snappos = ds_list_find_value(snapmanager.snappositions,i)
				}
			}
			startpos = snappos
		}
		var currnote = ""
		var copystart = 0
		var offset = 0
		ds_list_clear(currently_selected_notes)
		for(var i = 0; i < ds_list_size(copiednotes); i++){
			currnote = ds_list_find_value(copiednotes,i)
			
			var data = string_split(currnote, ",");
			if(i == 0){copystart = real(data[0])}
			else{offset = abs(copystart - real(data[0]))}
			var obj = instance_create_layer(real(data[0]),2000 - (real(data[3])*10),"Instances",obj_Noteobject,
			{
				tick: startpos + offset,
				duration: real(data[1]),
				hex1: real(data[2]),
				hex2: real(data[3]),
				hex3: real(data[4]),
				channelnumber: real(data[5])
			});
			obj.myhash = string(obj.tick) + "," + string(obj.duration) + "," + string(obj.hex1) + "," + string(obj.hex2) + "," + string(obj.hex3) + "," + string(obj.channelnumber) 
			ds_list_add(currently_selected_notes,obj)
		}
		savetoundostack()
		
	}
}
