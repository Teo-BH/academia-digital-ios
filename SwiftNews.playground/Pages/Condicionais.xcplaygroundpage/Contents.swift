//: [Voltar para Tuplas](@previous)
//: #### Condicionais
//: **if e else**
if 0 > 3 {
    print("O primeiro numero da expressão é maior que o segundo")
} else {
    print("O segundo numero é maior ou igual ao primeiro")
}

//: **else if**
var num = 7

if num == 10 {
    print("Aluno exemplar")
} else if num >= 7 {
    print("Bom Aluno")
} else {
    print("Aluno abaixo da média")
}


//: **Operadores AND e OR**
var numeroCupom = 40402
var horario = 10

if numeroCupom == 40402 && horario < 10 {
    print("Desconto concedido")
} else {
    print("Não foi possível conceder o desconto")
}

//: **Switch**
var nome = "Roberto"

switch nome {
case "Amandita":
    print("É a Amanda Mummy")
    
case "Roberto":
    print("É o grande parceiro Roberto")
    
case "Danilo":
    print("É o Daniloso...")
    
case "Trovilho":
    print("Grande Trovilhada")
    
default:
    print("Deve ser outra pessoa que não conheço =)")
}

//: [Ir para Controle de fluxo](@next)
