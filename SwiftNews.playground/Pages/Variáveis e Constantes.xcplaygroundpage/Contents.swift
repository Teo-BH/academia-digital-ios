//: [Voltar para Hello World](@previous)
/*:
## Variáveis e Constantes
    As palavras-chave let e var são utilizadas para indicar elementos 
    que armazenam valores. A principal diferença será sobre como o valor 
    é armazenado em memória. Se você deseja que o valor não tenha alteração, 
    utilize o let, caso contrário, se você estiver pensando em uma rotina 
    que ao longo do processamento sofrerá alterações no valor da informação 
    em memória, utilize o var.

    Sendo assim, devemos ter em mente que let armazenará valores constantes 
    e var armazenará valores variáveis.
*/
let nome = "Amanda Mummy"
var idade = 33

idade = 70

print("Minha idade é \(idade)")

/*:
## Tipos de variáveis
    A linguagem Swift é fortemente tipada e possui vários tipos de dados, 
    desde os primitivos, como Int, até tipos mais avançados e 
    complexos, como objetos. Cada variável deve ser declarada com 
    um tipo. Caso isso não  aconteça, a Swift tentará adivinhar o 
    tipo utilizado ao receber o valor.

    Não podemos, por exemplo, declarar uma variável do tipo inteiro (Int) 
    e tentar inserir um texto (String), pois isso gerará um erro na 
    compilação.
*/

// Declarando variável com tipagem explícita, já atribuindo um valor
let endereco: String = "Alameda Santos, 1000 - 7º andar - São Paulo - SP"

// Declarando e iniciando uma variável do tipo Int sem atribuir um valor explicitamente.
var ano: Int = Int()


//: [Ir para Operadores](@next)
