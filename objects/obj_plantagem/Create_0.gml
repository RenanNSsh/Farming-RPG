/// @description Insert description here
// You can write your code in this editor
colidivel = false;

larguraFrame = 32;
alturaFrame = 64;

tipoPlantagem = 0;
idadeDias = 0;
estagioCrescimento = 0;
duracaoEstagioDias = -1;
estagioCrescimentoMaximo = (sprite_get_width(spr_plantagem)/larguraFrame)-1;

crescidoCompletamente = false;
particula = -1;

xx = x-(larguraFrame/2)+2;
yy = y-alturaFrame+6;