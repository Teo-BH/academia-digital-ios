//: [Voltar para Strings](@previous)
/*: ### Collection Types
As Collection Types são tipos de dados que armazenam coleções de um tipo determinado. A Swift apresenta três tipos de Collection Types: Array, Dicionários e Set.
*/
//: #### Array
//: As varias formas de se iniciar um Array
var arrayExplicito : Array<String> = Array()
var arrayRange = [1...50]
var arraySimples = [Int]()
var arrayCheio = Array(["Oi", "tchay"])
var arrayAnyObject = [AnyObject?]()

//: Acessando um Array
arrayRange[0]
arrayRange.last
arrayRange.first

//: Adicionando elementos a uma array
arrayExplicito.append("Leandro")
arrayExplicito.append("Rodrigo")
arrayExplicito.append("Wallace")

//: Adicionando em locais específicos em um array
arrayExplicito.insert("Bruno", at: 2)

//: Contando quantidade de itens em um array
arrayExplicito.count

//: Removendo um elemento
arrayExplicito.removeLast()
arrayExplicito.removeFirst()
arrayExplicito.remove(at: 1)
arrayExplicito.removeAll()


//: #### Dicionários
//: Varias forma de declarar um dicionário
var dicionarioExplicito: Dictionary<String, String> = Dictionary()
var dicionarioConteudo = ["nome": "Leandro", "idade": "29 anos"]

//: Acessando adicionando valores ao dicionario
dicionarioExplicito["marca"] = "Fiat"
dicionarioExplicito["ano"] = "2014"

//: Contando objetos
dicionarioExplicito.count

//: Removendo elementos
dicionarioExplicito.removeValue(forKey: "ano")
dicionarioExplicito.removeAll()


//: #### Set
//: Formas de iniciar um Set
var meuSet: Set<String> = Set()
var letrasSet = Set(["L", "E", "C", "O"])

//: [Ir para Tuplas](@next)
