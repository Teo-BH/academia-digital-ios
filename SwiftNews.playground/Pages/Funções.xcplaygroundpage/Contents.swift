//: [Voltar para Controle de Fluxo](@previous)
/*: 
### Funções
*/
//: Criando uma função
func imprimirNaTela() {
    print("Quaddro treinamentos")
}

//: Chamando uma função.
imprimirNaTela()

//: Funções com parâmetros
func retornaTexto(texto: String)-> String {
    let textoRetorno = "Inicio \(texto) Fim"
    return textoRetorno
}

retornaTexto(texto: "Oi, meu nome é Gervásio")

/*: ####Funções de sistema
**min**
Retorna o menor valor de uma sequencia
*/
var menor = min(1000,7,3171,3080)
print("Menor Valor: \(menor)")

/*:
**max**
Retorna o maior valor de uma sequência
*/
var maior = max(1000,7,3171,3080)
print("Maior Valor: \(maior)")

/*:
**sort**
Utilizamos esta função para ordenar coleções.
*/
var numeros = [10,5,7,2,3,9,1]
numeros.sort()
print(numeros)

/*:
**dump**
Exibe o conteúdo de um array de forma detalhada e em formato de árvore.
*/
let linguagens = ["Objective-C", "Swift", "C", "PHP", "Python"]
dump(linguagens)

/*:
**join**
Função utilizada para adicionar um elemento/separador/caractere entres os elementos de uma coleção.
*/
let operacoes = ["soma", "divisão", "multiplicação", "divisão", "resto"]
var operacoesJuntas = operacoes.joined(separator: "-")
print("Operações juntas \(operacoesJuntas)")


//: [Ir para Closures](@next)
