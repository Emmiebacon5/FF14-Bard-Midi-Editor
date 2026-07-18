// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script2(){
	var currentchannel = -1; //start at -1 straight into 0
	for(var i = 0; i < ds_list_size(global.filedata); i++){
		var currvalue = ds_list_find_value(global.filedata,i);
		
		if (currvalue == 0){ continue;}
		if (currvalue == -21){
			//eof
			exit;
		}
		if (i == 0){
			//we know this is a TPQ message
			midimanager.importTPQ = currvalue
			midimanager.TPQ = currvalue;
			midimanager.startTPQ = currvalue;
			midimanager.actualfuckingtpq = currvalue;
			midimanager.tickspersecond = ds_list_find_value(global.filedata,i+1)
			i++;
			continue;
		}
		
		if (currvalue == -20){
			//we know this is next channel
			currentchannel ++;
			
			continue;
		}
		if (currvalue >= 192 and currvalue <= 207){
			//we know this is programchange
			var obj = instance_create_layer(x,y,"Instances",obj_program_change);
			obj.msg1 = currvalue
			obj.msg2 = ds_list_find_value(global.filedata,i+1)
			obj.tick = ds_list_find_value(global.filedata,i-3)
			i++;
			continue;
		}
		if (currvalue == -22){
			//we know this is a tempochange
			var newtpq = ds_list_find_value(global.filedata,i+1);
			//newtpq = 60000000 / newtpq;
			newtpq = newtpq;
			midimanager.importTPQ = newtpq;
			//with(obj_tempo_change){if(tick == 0) {instance_destroy()}} //delete duplicate start tempos
			var object = instance_create_layer(64,64,"instances",obj_tempo_change);
			object.exportTPQ = newtpq;
			object.storedtempo = 60000000/newtpq;
			object.tick = ds_list_find_value(global.filedata,i-1);
			if (object.tick == 0){
				midimanager.starttempo = newtpq
				midimanager.tempo = 60000000/newtpq
				//midimanager.TPQ = newtpq
			}
			i = i + 1 //moving on
		}
		
		if (currvalue == -1){ //code for noteon
			var hex1 = ds_list_find_value(global.filedata,i+4);
			var hex2 = ds_list_find_value(global.filedata,i+5);
			var hex3 = ds_list_find_value(global.filedata,i+6);
			
			
			
			var object = instance_create_layer(64,64,"instances",obj_Noteobject);
			object.tick = ds_list_find_value(global.filedata,i-1);
			object.duration = ds_list_find_value(global.filedata,i+1);
			object.hex1 = hex1;
			object.hex2 = hex2;
			object.hex3 = hex3;
			object.channelnumber = currentchannel;
			i = i+6; //moving on
			
			
		}
	}
}