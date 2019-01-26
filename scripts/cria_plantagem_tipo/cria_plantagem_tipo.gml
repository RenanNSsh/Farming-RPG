///@description cria_plantagem_tipo
///@arg duracao_estagio_crescimento
///@arg preco 

var argNum = argument_count;

if(!ds_exists(ds_plantagem_tipo,ds_type_grid)){
	ds_plantagem_tipo = ds_grid_create(argNum,1);
	var altura = 1;
} else {
	var altura = ds_grid_height(ds_plantagem_tipo);
	ds_grid_resize(ds_plantagem_tipo,argNum, altura+1);
	altura +=1;
}

var yy = altura -1;
for(var i = 0; i< argNum;i++){
	ds_plantagem_tipo[# i,yy] = argument[i];
}