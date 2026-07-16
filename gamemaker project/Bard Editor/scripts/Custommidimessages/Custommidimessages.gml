// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SendProgramChange(channel,instrument){
	rtmidi_send_message(192 + channel,instrument,0)
}