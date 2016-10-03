//: [Voltar Condicionais](@previous)
/*: ### Controle de Fluxo
Podemos dizer que uma estrutura de controle de fluxo é responsável por repetir um determinado bloco de código até que uma condição específica seja verdadeira. Isso pode parecer confuso a princípio, mas conforme formos avançando, vocês verão que é bem mais tranquilo na prática.
*/
//: **for-in**
for numero in 1...10{
    print(numero)
}

//: Percorrendo Array com for in
let semestre = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"]
for mes in semestre{
    print("Estamos no mês \(mes)")
}

//: Retornando em um tupla
for (indice, mes) in semestre.enumerated() {
    print(" Na posição \(indice) o mês \(mes)")
}

//: **for**

//for var x = 1; x <= 10; x+1 {
for x in 1...10 {
    print(x)
}

//: **while**
var y = 1
while y <= 10 {
    print("Rodei \(y) vezes")
    y = y+1
}

//: **do while**
var z = 10
repeat{
    print("Executei uma vez e sai")
}while(z < 10)

//: [Ir para Controle de fluxo](@next)
