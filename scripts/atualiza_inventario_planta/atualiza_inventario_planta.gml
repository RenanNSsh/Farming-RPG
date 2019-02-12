///@description atualiza_inventario_planta

var dsInventario = inventario.ds_inventario;
	var	dsInventario_linhas = ds_grid_height(dsInventario);
	for(var linha = 0; linha<dsInventario_linhas;linha++){
		var encontrou = false;
		//Checa se a linha atual é a linha da planta;
		var tipoItem = dsInventario[# 0, linha];
		var planta = plantagem.plantaSelecionada+1;
		if(tipoItem == planta){
			dsInventario[# 1, linha]--;
			
			//Se for zero, remove do slot
			if(dsInventario[# 1,linha] == 0) {
				dsInventario[# 0, linha] = item.nenhum;		
				remove_planta_selecao(plantagem.plantaSelecionada);
			}			
			
			
			break;
		}
	}