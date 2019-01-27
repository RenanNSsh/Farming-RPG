/// @description Insert description here
// You can write your code in this editor
ds_plantagem_tipo = -1;
ds_plantagem_instancias = -1;
ds_plantagem_data = ds_grid_create(4,1);

ds_grid_clear(ds_plantagem_data, -1);

enum plantas {
	tomate,
	batata,
	cenoura,
	alcachofra,
	pimenta,
	pepino,
	milho,
	tamanho = 7
}

cria_plantagem_tipo(4,40,"tomate");
cria_plantagem_tipo(5,55,"batata");
cria_plantagem_tipo(3,35,"cenoura");
cria_plantagem_tipo(2,25,"alcachofra");
cria_plantagem_tipo(3,30,"pimenta");
cria_plantagem_tipo(2,20,"pepino");
cria_plantagem_tipo(5,50,"milho");

plantando = false;

plantaSelecionada = -1;

mouseX = 0;
mouseY = 0;

tamanhoFrame = 32;