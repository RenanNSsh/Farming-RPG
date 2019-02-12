

var dsPlantaInventario = inventario.ds_plantasInventario;
var planta_Selecionada = plantagem.plantaSelecionada;
var plantaRemover = argument0;
//Atualiza a lista de Plantas, caso alguma não esteja no inventario
if(!ds_list_empty(dsPlantaInventario) && !existe_planta(plantaRemover+1)){
	var indexPlanta = ds_list_find_index(dsPlantaInventario, plantaRemover);
	ds_list_delete(dsPlantaInventario,indexPlanta);
	if (plantaRemover = planta_Selecionada){
		plantagem.plantaSelecionada = ds_list_find_value(dsPlantaInventario,inventario.indicePlantaSelecionada);
	}
}
