/// @description Insert description here
// You can write your code in this editor

var notificacao_grade = ds_notificacoes;
var linhas_grade = ds_grid_height(notificacao_grade);


var metadeDaJanela = altura_janela /2;
var cor = c_white;

for(var linhaAtual=0; linhaAtual<linhas_grade;linhaAtual++){
	var sinal = "";
	if(notificacao_grade[# 0, linhaAtual] >0){sinal = "+";}	
	
	var posicaoDeCadaNot = linhaAtual*string_tamanho;
	var todasNot = linhas_grade*string_tamanho;
	
	draw_text_color(
		100,
		metadeDaJanela+posicaoDeCadaNot-todasNot,
		sinal+string(notificacao_grade[# 0, linhaAtual]) + " " + string(notificacao_grade[# 1, linhaAtual]),
		cor,
		cor,
		cor,
		cor,
		nao_alpha
	);
}

if(desaparecer) nao_alpha -=0.1;
if(nao_alpha <= 0) instance_destroy();