/// @description Insert description here
// You can write your code in this editor
if(ds_exists(ds_plantagem_tipo,ds_type_grid)){
	ds_grid_destroy(ds_plantagem_tipo);
}
if(ds_exists(ds_plantagem_instancias,ds_type_grid)){
	ds_grid_destroy(ds_plantagem_instancias);
}
if(ds_exists(ds_plantagem_data,ds_type_grid)){
	ds_grid_destroy(ds_plantagem_data);
}
