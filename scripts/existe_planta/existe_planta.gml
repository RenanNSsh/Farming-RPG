///@description existe_planta
///@arg planta
var planta = argument0;

var dsInventario = inventario.ds_inventario;
var	dsInventario_linhas = ds_grid_height(dsInventario);


for(var linha = 0; linha<dsInventario_linhas;linha++){
		//Checa se a linha atual é a linha da planta;
	var tipoItem = dsInventario[# 0, linha];
	if(tipoItem == planta){
		return true				
	}
}

return false;
	