/// @description Insert description here
// You can write your code in this editor
rtmidi_init()

randomise()

rtmidi_set_outport(0)
var ins = rtmidi_probe_ins()
var outs = rtmidi_probe_outs()

global.undoredostack = ds_list_create()
global.stackposition = 0
for (var i = 0; i < 10; i++){
	ds_list_add(global.undoredostack,ds_list_create())
}

visiblenotelist = ds_list_create()