//: [Voltar para Operadores](@previous)
/*:
### String e Characters
*/
//: Declarando uma string vazia
let strVazia = ""

//: Declarando outra String vazia
let outraVazia = String()

//: Declarando uma String com um texto
let texto = "Eu sou um texto declarado na criação"

//: Concatenando o texto utilizando o operador +
var concatena = "Começo do texto " + " concatenado."

//: Outra forma de concatenar o texto
concatena += " Por Amanda Tutankhamun"

//: Verificando se uma string é vazia
concatena.isEmpty

//: Percorrendo uma String
for var char in concatena.characters{
    print(char)
}




/*: #### Novidade da Swift 2: O tipo String deixou de ser um Collection type mas ainda pode acessar seus caracteres*/
//: Mostra quantos caracteres tem na String
concatena.characters.count

//: Resgata a última posição dos caractere
concatena.characters.last

//: Resgata a primeira posição dos caracteres
concatena.characters.first

//: Comparando textos
var nome = "Danilo"
var outroNome = "Leandro"

(nome == outroNome)
(nome != outroNome)
(nome > outroNome)
(nome < outroNome)

//: Compilado como uma String
var umaString = ""

//: Declarando um Character
var umChar: Character = "a"
print("HEllo")
//: Outra forma
var outroChar = Character("U")

//: Criando um Character usando Unicode
let caracter2: Character = "\u{24}"

//: Criando um coração usando Unicode
let caracter3 = "\u{2665}"

//: Criando Yin Yang usando Unicode
let caracter4 : Character = "\u{262F}"

//: [Ir para Collection Types](@next)
