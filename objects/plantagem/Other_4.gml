/// @description Insert description here
// You can write your code in this editor

if(room == rm_fazenda){
	
	ds_plantagem_instancias = ds_grid_create(room_width div tamanhoFrame, room_height div tamanhoFrame);
	ds_grid_clear(ds_plantagem_instancias,0);
	
	if(ds_plantagem_data[# 0, 0] != -1){
		var numero_instancias = ds_grid_height(ds_plantagem_data);
		for(var slot=0;slot< numero_instancias;slot++){
			respawn_plantagem(
				ds_plantagem_data[# 0,slot],
				ds_plantagem_data[# 1,slot],
				ds_plantagem_data[# 2,slot], 
				ds_plantagem_data[# 3,slot]
			);
		}
		
		with(obj_plantagem){
			if(estagioCrescimento < estagioCrescimentoMaximo){		
				estagioCrescimento = (idadeDias div duracaoEstagioDias);			
			}else{
				estagioCrescimento = estagioCrescimentoMaximo;
				crescidoCompletamente = true;
				alarm[1] = 1;
			}
		}
	}
}