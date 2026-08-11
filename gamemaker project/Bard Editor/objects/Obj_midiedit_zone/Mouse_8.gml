/// @description Insert description here
// You can write your code in this editor
if (drawnewnote) and (!drawselectbox) and (boxendx > boxstartx){
	var obj = instance_create_layer(boxstartx,boxstarty,"Instances",obj_Noteobject,{
	tick : boxstartx,	
	hex1 : 144 + 0, //144 + selected channel	
	hex2 : (2000 - boxstarty) / 10,
	hex3 : 100,
	duration : boxendx - boxstartx,
		
		
	})
	savetoundostack()
	
	
	drawnewnote = false;
	boxstartx = 0
	boxendx = 0
	boxstarty = 0
}