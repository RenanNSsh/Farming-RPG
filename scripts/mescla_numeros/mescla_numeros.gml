///@description mescla_numeros
///@arg num1
///@arg num2
///@arg quantidade

var num1 = argument0;
var num2 = argument1;
var quantidade = argument2;

var diferenca = num1 - num2;
var mesclado = num1 - (diferenca * quantidade);

return mesclado;