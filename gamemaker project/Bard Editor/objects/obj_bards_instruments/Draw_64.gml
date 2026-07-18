/// @description Insert description here
// You can write your code in this editor

var inst = 0 //we only draw the instruments of the 8 main bards
for (var i = 0; i < 4; i++){
	for (var j = 0; j < 2; j++){
		draw_text_color(1000 + j*200,80+i*115,string(ds_list_find_value(instruments,inst)),c_black,c_black,c_black,c_black,100)
		inst++
	}
}