/// @description Insert description here
// You can write your code in this editor
if(room == rm_fazenda){

	if(instance_exists(obj_plantagem)){
		with(obj_plantagem){
			if(estagioCrescimento < estagioCrescimentoMaximo){
				idadeDias++;			
				estagioCrescimento = (idadeDias div duracaoEstagioDias);			
			}else{
				estagioCrescimento = estagioCrescimentoMaximo;
				crescidoCompletamente = true;
				if(tipoPlantagem == plantas.milho){
					colidivel = true;
				}
				alarm[1] = 1;
			}
		}
	}
}else if(ds_plantagem_data[# 0, 0] != -1){
	var linhas = ds_grid_height(ds_plantagem_data);
	for(var yy = 0; yy <linhas; yy++){
		ds_plantagem_data[# 3, yy]++;		
	}
}