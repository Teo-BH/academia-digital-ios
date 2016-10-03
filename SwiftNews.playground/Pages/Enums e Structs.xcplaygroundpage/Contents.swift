//: [Enums e Structs](@previous)
/*:
### Enum
Enum (ou enumerado) é um tipo utilizado para definir uma lista de valores. Podemos fazer uma analogia com o mundo do desenvolvimento web e dizer que toda vez que usaríamos um dropdown de valores na web, podemos usar Enums na Swift.

Uma enumeração pode armazenar valores de qualquer tipo e os tipos destes valores podem ser diferentes para cada membro da enumeração. Para declarar um Enum, utilizamos a palavra enum, seguida do nome que daremos ao nosso Enum. Dentro do bloco, utilizamos case (sim, igual ao do switch) para cada opção.
*/

//: Declarando um Enum
enum PontosCardeais {
    case Norte
    case Sul
    case Leste
    case Oeste
}
//: Utilizando um enum
var direcao = PontosCardeais.Leste
direcao = .Norte

//: Também podemos declarar Enums que recebem diferentes tipos:
enum Tipos {
    case Str(String)
    case Num(Double)
}

var valor = Tipos.Str("hello")
valor = .Num(1.0)

// Para extrairmos os valores inseridos em um enum, utilizamos switch
switch valor {
case .Str(let val):
    print(val)
case .Num(let val):
    print(val)
}

/*: Podemos utilizar Enums de maneira fortemente tipada, fazendo com que seus valores sejam sempre do mesmo tipo.
Se utilizarmos inteiros, os valores são auto-incrementados se uma sequência não for informada. Não é possível declarar valores iguais.
*/
enum Semana : Int {
    case Domingo=78,Segunda,Terça,Quarta,Quinta,Sexta,Sábado
}

var hoje = Semana.Quarta

//: Utilizamos .rawValue para extrairmos o valor bruto informado dentro do Enum.
Semana.Quinta.rawValue

/*:
### Structs
Uma Struct nos permite criar um tipo de dado estruturado que fornece um armazenamento de dados usando propriedades e funcionalidades através de métodos. É semelhante ao conceito de orientação a objetos, mas na verdade o conceito de Struct é mais simples do que uma classe, pois não permite herança.

Suas instâncias são sempre passadas por valor, diferentemente de classes, que são passadas por referência.
*/

struct Pessoa{
    var nome:String = ""
    var idade: Int = 0
    var profissao: String?
        
        
    func trabalhar(){
        let trabalho = profissao ?? "herdeiro"
        print("\(nome) está trabalhando de \(trabalho)")
    }
}

//: Utilizando uma Struct
var amigo: Pessoa = Pessoa()
amigo.nome = "Leandro"
amigo.idade = 20

amigo.trabalhar()


//: [POO](@next)
