/// @description Insert description here
// You can write your code in this editor
if(!mostrarInventario) exit;

draw_text(150,10,string(mouse_slotX));
draw_text(180,10,string(mouse_slotY));


//Desenha interface invetario
draw_sprite_part_ext(inventarioUI, 0, tamanhoFrame, 0, inventarioLargura, inventarioAltura, xStart, yStart,escala,escala, c_white, 1);


//desenha nome jogador
var jogadorInfo = ds_player_informacao;
draw_set_font(fnt_texto_24);
var cor = c_black;
draw_text_color(informacaoPersonagemX,informacaoPersonagemY,jogadorInfo[# 0, 3] +": "+ jogadorInfo[# 1, 3],cor,cor,cor,cor,1);


	
//desenha moedas jogador
draw_set_font(fnt_numeros);
for(var yy=0;yy<3;yy++){
	draw_text_color(informacaoPersonagemX+(195 * escala) +((15+18)*escala*yy),informacaoPersonagemY+5, string(jogadorInfo[# 1, yy]), cor, cor, cor, cor, 1);
	
}

//----Inventario
var indexX = 0, indexY = 0, xx, yy, spriteX, spriteY, iitem, gradeInventario;
gradeInventario = ds_inventario;

for(var index=0;index < inventario_slots;index++){
	
	//x,y Localização do slot
	xx = slots_x + ((tamanhoFrame+x_distancia_slot)*escala*indexX);
	yy = slots_y + ((tamanhoFrame+y_distancia_slot)*escala*indexY);
	
	//Item
	iitem = gradeInventario[# 0, index];
	spriteX = (iitem mod inventarioItens_colunas)*tamanhoFrame;
	spriteY = (iitem div inventarioItens_colunas)*tamanhoFrame;
	
	//Desenha slot e Item
	draw_sprite_part_ext(inventarioUI,0,0,0,tamanhoFrame,tamanhoFrame,xx,yy, escala,escala,c_white,1);

	switch(index){
			case slot_selecionado:
				if(iitem > 0) draw_sprite_part_ext(
					inventarioItens,0,spriteX,spriteY,tamanhoFrame,tamanhoFrame,xx,yy,escala, escala, c_white,1
				);
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(inventarioUI,0,0,0,tamanhoFrame,tamanhoFrame,xx,yy,escala,escala,c_white,.3);
				gpu_set_blendmode(bm_normal);
			break;
			case slot_pegado:
				if(iitem > 0) draw_sprite_part_ext(
					inventarioItens,0,spriteX,spriteY,tamanhoFrame,tamanhoFrame,xx,yy,escala, escala, c_white,0.2
				);
			break;
			default:
				if(iitem > 0) draw_sprite_part_ext(
					inventarioItens,0,spriteX,spriteY,tamanhoFrame,tamanhoFrame,xx,yy,escala, escala, c_white,1
				);
			break;
	}
		
	
	
	if(iitem > 0 ){
		var numero = gradeInventario[# 1, index];
		draw_text_color(xx+3,yy,string(numero),cor,cor,cor,cor,1);
	}
	
	if(indexX >= inventario_slots_largura-1){
		indexX = 0;
		indexY++;
	}else{
		indexX++;
	}
	
}

//Desenha a Descrição do Item
var dDescricao_grade = ds_descricao_itens, descricao = "";
iitem = gradeInventario[# 0, slot_selecionado];

	if(iitem >=0){
		draw_set_font(fnt_texto_12);		
		descricao = string(dDescricao_grade[# 0, iitem]) + ". "+ string(dDescricao_grade[# 1, iitem]);
		cor = c_black;
		draw_text_ext_color(descricao_x,descricao_y,descricao,string_height("M"), escala * larguraTela - (x_distancia_slot*2),cor,cor,cor,cor,1)
	}

if(slot_pegado != -1){	
	iitem = gradeInventario[# 0, slot_pegado];
	spriteX = (iitem mod inventarioItens_colunas)*tamanhoFrame;
	spriteY = (iitem div inventarioItens_colunas)*tamanhoFrame;
	var posMouseX =  mouseX+15;
	var posMouseY = mouseY;
	draw_sprite_part_ext(
		inventarioItens,0,spriteX,spriteY,tamanhoFrame,tamanhoFrame,posMouseX,posMouseY,escala, escala, c_white,1
	);
	
	var inventarioNum = gradeInventario[# 1, slot_pegado];
	draw_text_color(posMouseX,posMouseY,string(inventarioNum),cor,cor,cor,cor,1);
}