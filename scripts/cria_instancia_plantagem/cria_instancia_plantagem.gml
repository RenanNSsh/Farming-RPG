///@description cria_instancia_plantagem
///@arg x
///@arg y
///@arg tipo_plantagem

var tamanhoFrame = plantagem.tamanhoFrame;
var gradeX = argument0 div tamanhoFrame;
var gradeY = argument1 div tamanhoFrame;
var gradeInstancias = plantagem.ds_plantagem_instancias;
var celula = gradeInstancias[# gradeX,gradeY];

if(celula == 0){
	xx = gradeX * tamanhoFrame;
	yy = gradeY * tamanhoFrame;

	//Checa o solo
	var camada_id = layer_get_id("L1_SoloFertil");
	var mapa_id = layer_tilemap_get_id(camada_id);
	var data = tilemap_get_at_pixel(mapa_id,argument0,argument1);

	if(data == 0){
		show_debug_message("Não tem solo fértil aqui.");
		return false;
	}else{
		show_debug_message("tem solo fértil aqui.");
	}
	
	//Altera o inventario
	atualiza_inventario_planta();
	
	//Cria a instancia
	var instanciaPlantagem = instance_create_layer(xx+(tamanhoFrame/2),yy+(tamanhoFrame/2),"Instancias",obj_plantagem);
	gradeInstancias[# gradeX, gradeY] = instanciaPlantagem;

	//da as caracteristicas da plantagem
	with(instanciaPlantagem){
		tipoPlantagem = argument2;
		duracaoEstagioDias = plantagem.ds_plantagem_tipo[# 0, tipoPlantagem];
	}

	return instanciaPlantagem; 
}else{
	show_debug_message("Já tem algo aí");
	return false;
}