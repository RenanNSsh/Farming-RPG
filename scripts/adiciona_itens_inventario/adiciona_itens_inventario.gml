///@description adiciona_itens_inventario

var dsPlantasLista = inventario.ds_plantasInventario;
var dsInventario = inventario.ds_inventario;
var plantasExistentes = [];

for(var yy = 0; yy < inventario_slots;yy++){
	var itemAleatorio = irandom_range(1, item.tamanho - 1);
	var quantidadeAleatorio = irandom_range(1,3);
	dsInventario[# 0, yy] = itemAleatorio;
	dsInventario[# 1, yy] = quantidadeAleatorio;
	
	if(itemAleatorio <= plantas.tamanho){
		var planta = itemAleatorio-1;
		var repetido = false;
		for(var indice = 0; indice< array_length_1d(plantasExistentes);indice++){
			if(planta == plantasExistentes[indice]) {repetido = true; break; }
		}
		if(!repetido){
			plantasExistentes[array_length_1d(plantasExistentes)] = planta;			
			ds_list_add(dsPlantasLista,planta);		
		}
		
	}
	
}