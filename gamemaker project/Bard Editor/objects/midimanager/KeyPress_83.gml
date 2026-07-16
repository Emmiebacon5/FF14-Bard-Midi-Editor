/// @description Insert description here
// You can write your code in this editor
var ctrlheld = keyboard_check(vk_control)

if (ctrlheld){
	show_debug_message("starting save");
	var size = 99999999;
	buffer = buffer_create(size * buffer_sizeof(buffer_s32), buffer_fixed, 1);
	biggestchannel = 0;

	buffer_write(buffer,buffer_s32,startTPQ);
	buffer_seek(buffer, buffer_seek_start, 3*buffer_sizeof(buffer_s32));
	with(obj_Noteobject){
		//(midimanager.TPQ/60)*(midimanager.tickspersecond/ (midimanager.TPQ/60)
		buffer_write(midimanager.buffer,buffer_s32,-1)
		buffer_write(midimanager.buffer,buffer_s32,tick)
		buffer_write(midimanager.buffer,buffer_s32,hex2)
		buffer_write(midimanager.buffer,buffer_s32,duration)
		buffer_write(midimanager.buffer,buffer_s32,channelnumber)
		if(channelnumber > midimanager.biggestchannel){midimanager.biggestchannel = channelnumber}
	}
	with(obj_tempo_change){
		buffer_write(midimanager.buffer,buffer_s32,-22)
		buffer_write(midimanager.buffer,buffer_s32,tick/(midimanager.tickspersecond/ (tick/60)))
		buffer_write(midimanager.buffer,buffer_s32,newTPQ)
	}


	show_debug_message(buffer_get_used_size(buffer)/buffer_sizeof(buffer_s32))
	buffer_write(buffer,buffer_s32,-21) //eof
	buffer_seek(buffer, buffer_seek_start, 1*buffer_sizeof(buffer_s32)); //go back and set track number
	buffer_write(midimanager.buffer,buffer_s32,-2);
	buffer_write(midimanager.buffer,buffer_s32,biggestchannel)
	show_debug_message("sedning to dll");
	savemidifile(buffer_get_address(buffer))
	show_debug_message("finished save");
	audio_play_sound(FFXIV_FATE01_Complete,1,0)
	buffer_delete(buffer);
}
