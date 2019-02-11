

var dsPlantaInventario = inventario.ds_plantasInventario;
var planta_Selecionada = plantagem.plantaSelecionada;
//Atualiza a lista de Plantas, caso alguma não esteja no inventario
if(!ds_list_empty(dsPlantaInventario) && !existe_planta(planta_Selecionada+1)){
	var indexPlanta = ds_list_find_index(dsPlantaInventario, planta_Selecionada);
	ds_list_delete(dsPlantaInventario,indexPlanta);
}
