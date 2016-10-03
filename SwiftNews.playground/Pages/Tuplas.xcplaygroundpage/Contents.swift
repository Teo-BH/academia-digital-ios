//: [Voltar para Collection Types](@previous)
/*: ### Tuplas
Tuplas, em Swift, são um tipo composto. Podemos dizer que uma tupla poderia ser um Collection Type, como um Array, mas de forma mais simplificada, possibilitando que uma variável possa ter vários valores diferentes, e estes valores podem ser acessados por uma chave.
*/
//: Declarando uma tupla
var tupla: (nome: String, email:String, idade:Int) = ("Leandro","leandro.r@quaddro.com.br", 29)
var tuplaIndice = ("Sem", "Nenhum", "Indice")
var outraTupla = (carro: "Gol", cc: "200cv")

//: Acessando uam tupla
print("Meu nome é \(tupla.nome), meu email é \(tupla.email) e minha idade é \(tupla.idade)")

//: Decompondo uma tupla
var (x, y, z) = tupla
x
y
z

//: Decompondo uma tupla ignorando alguns argumentos
var (_,_,l) = tupla
l

//: **Dica** Tuplas também podem ser retornadas em funções e métodos ;)

//: [Ir para Condicionais](@next)
