/// @description Insert description here
// You can write your code in this editor
rtmidi_init()
var ins = rtmidi_probe_ins()
var outs = rtmidi_probe_outs()
randomise()

rtmidi_set_outport(0)