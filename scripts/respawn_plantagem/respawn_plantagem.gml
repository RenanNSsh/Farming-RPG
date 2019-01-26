///@description respawn_plantagem
///@arg grade_x
///@arg grade_y
///@arg tipo_plantagem
///@arg idade_dias

var xx = argument0 * tamanhoFrame;
var yy = argument1 * tamanhoFrame;

//Cria a instancia
var inst = instance_create_layer(xx+(tamanhoFrame/2),yy+(tamanhoFrame/2), "Instancias",obj_plantagem);
ds_plantagem_instancias[# argument0, argument1] = inst;
show_debug_message("Respawnando um(uma) "+ds_plantagem_tipo[# 2,argument2])


//Da as caracteristicas a planta
with(inst){
	tipoPlantagem = argument2;
	idadeDias = argument3;	
	duracaoEstagioDias = plantagem.ds_plantagem_tipo[# 0, tipoPlantagem];
}

return inst;