///@description cria_instancia_plantagem
///@arg x
///@arg y
///@arg tipo_plantagem

//Cria a instancia
var instanciaPlantagem = instance_create_layer(argument0,argument1,"Instancias",obj_plantagem);

//da as caracteristicas da plantagem
with(instanciaPlantagem){
	tipoPlantagem = argument2;
	duracaoEstagioDias = plantagem.ds_plantagem_tipo[# 0, tipoPlantagem]
}

return instanciaPlantagem;