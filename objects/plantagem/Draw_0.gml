/// @description Insert description here
// You can write your code in this editor

if(!plantando) exit;

var frame = tamanhoFrame;
var gradeX = (mouseX div frame);
var gradeY = (mouseY div frame);

var corPossivelPlantar = c_red;
var celula = ds_plantagem_instancias[# gradeX,gradeY];

if(celula == 0){
	var camadaId = layer_get_id("L1_SoloFertil");
	var mapaId = layer_tilemap_get_id(camadaId);
	var data = tilemap_get_at_pixel(mapaId,mouseX,mouseY);
	if(data!=0) corPossivelPlantar = c_lime;
}

xx = gradeX * frame;
yy = gradeY * frame;

draw_rectangle_color(xx,yy, xx+frame, yy+frame, corPossivelPlantar, corPossivelPlantar, corPossivelPlantar, corPossivelPlantar, true);

if(plantaSelecionada != -1){
	draw_sprite(spr_plantagem_pronto,plantaSelecionada, xx+(frame/2), yy+(frame/2));
}
 