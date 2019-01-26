/// @description Insert description here
// You can write your code in this editor

if(room == rm_fazenda){
	var inst_num = instance_number(obj_plantagem)
	if(inst_num == 0){ ds_grid_clear (ds_plantagem_data, -1);}
	else{
		ds_grid_resize(ds_plantagem_data, ds_grid_width(ds_plantagem_data),inst_num);
		
		var larguraDS = ds_grid_width(ds_plantagem_instancias);
		var alturaDS = ds_grid_height(ds_plantagem_instancias);
		var slot = 0;
		
		for(var xx = 0;xx<larguraDS;xx++){
			for(var yy = 0;yy<alturaDS;yy++){
				var instancia = ds_plantagem_instancias[# xx, yy];
				
				if(instancia != 0){
					ds_plantagem_data[# 0, slot] = xx;
					ds_plantagem_data[# 1, slot] = yy;
					ds_plantagem_data[# 2, slot] = instancia.tipoPlantagem;
					ds_plantagem_data[# 3, slot] = instancia.idadeDias;
					slot++;
				}
			}
		}
		
		ds_grid_destroy(ds_plantagem_instancias);
		
	}
}