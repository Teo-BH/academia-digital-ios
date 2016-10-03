//: [Voltar para Optionals](@previous)
import Foundation
/*:
### Optionals
Não existe, no mundo da programação, uma forma universal de tratarmos a ausência de valores. Essa falta de padrão pode ser um problema. Até podemos utilizar ferramentas como NSNotFound, NSIntegerMax, entre outras para representar a ausência de valores nulos, mas não resolve o problema do padrão, e é exatamente aí que entram os Optionals.

Os Optionals foram inseridos na Swift justamente para unificar a representação de vazio e flexibilizar os tipos. Ao utilizá-los, podemos até perder um pouco da facilidade do uso do nil — quem vem do Objective-C sabe bem do que estou falando — mas ganhamos performance, segurança e uma forma consistente de lidarmos com nulos, independente do tipo de variável.
*/
//: Declarando um optional
var meuNome: String?

//: O fato de a variável ser um Optional não significa que ela necessariamente precisa ser do tipo String. A leitura correta seria “a variável meuNome é um Optional, que pode ou não ser do tipo String”. Essa informação é muito importante pois significa que, mesmo com a declaração do tipo, não significa que você está lidando especificamente com o tipo especificado.
meuNome = nil

/*: 
Quando declaramos uma variável ou constante como Optional, estamos dizendo que ela precisa ser desempacotada para ser utilizada. Podemos fazer isso de basicamente três formas:
 * Utilizando o Unwrap através do operador !
 * Inserindo o valor em uma constante temporária, usando o Optional Binding
 * Ou podemos colocar um valor padrão, caso a variável seja nula.

#### Force Unwrap
O Force Unwrap é utilizado quando desejamos desempacotar um Optional o qual temos certeza que tem um valor. Isso significa que, se tentarmos desempacotar um valor nulo usando o Force Unwrap, a aplicação retornará um erro. Então, muito cuidado com esse carinha aqui.
*/
var valor: Int? = 42

print(valor)
print(valor!)

//: **Nota** Só utilize o force unrwap quando tiver certeza de que a variável possui um valor, caso contrário, prefira Optional Binding

//: #### Optional Binding
//: Usamo o Optional Binding para desempacotar um valor de dentro de um optional de maneira segura, depositando-o em uma constante.
var amigo: String? = "Gervásio"

if let amigao = amigo{
    print("Desempacotou")
}else{
    print("Não foi possível desempacotar")
}

//: **Guard** Especialista em falhas

struct Blog {
    var name: String?
    var post: String?
    var date: NSDate?
    
    func myBlogName(blog: Blog){
        //The old way
//        if let blogName = blog.name{
//            print("Meu blog se chama \(blogName)")
//        }else{
//            print("Eh, parece que o jogo virou")
//        }
        guard let blogName = blog.name else{
            print("Eh, parece que o jogo virou e vc saiu do metodo")
            return
        }
        print(blogName)
    }
}

var myBlog = Blog()
myBlog.myBlogName(blog: myBlog)

//: Utilizando um valor padrão.
var meuTexto: String? = nil
meuNome = "Oi"

let tiraDai = meuNome ?? "Nennhum texto encontrado"

//: [Ir para Type Casting](@next)





