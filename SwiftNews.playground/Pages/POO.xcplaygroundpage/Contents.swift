//: [Voltar para Enums](@previous)
/*:
### POO
A Programação Orientada a Objetos foi uma grande mudança de paradigma no desenvolvimento de aplicações, trazendo estruturas semelhantes às do mundo real para dentro da programação. Utilizando esse paradigma, podemos construir aplicações robustas e mais eficientes, gerando menos esforço para manutenção e mais reutilização de códigos.
*/
//: Criando uma classe
class Pessoa{
    var nome: String = ""
    var rg: String = ""
    var idade: Int = 0
    var peso: Float = 0.0
    
    func andar(){
        print("Começou a Andar!")
    }
}
//: Instanciando e utilizando propriedades e métodos
var gervasio: Pessoa = Pessoa()

gervasio.nome = "Gervásio da Silva"
gervasio.rg = "430287039"
gervasio.idade = 70
gervasio.peso = 72.0


gervasio.andar()

//: **Métodos inicializadores**
class Empresa{
    
    var cnpj: String = String()
    var nomeFantasia: String = String()
    var faturamentoAnual: Double = Double()
    
    
    init(cnpj: String, nomeFantasia: String, faturamentoAnual: Double){
        self.cnpj = cnpj
        self.nomeFantasia = nomeFantasia
        self.faturamentoAnual = faturamentoAnual
        
        print("Iniciando a classe Empresa: Nome: \(self.nomeFantasia)")
    }
}

var petrobras: Empresa? = Empresa(cnpj: "3299420424-24", nomeFantasia: "BR", faturamentoAnual: 2_000_000)



//: **willSet e didSet**

class Abastecer{
    var contador: Int = Int(){
        willSet(novaContagem){
            print("Abastecer \(novaContagem) litros")
        }
        didSet{
            let novoValor = oldValue
            if contador > novoValor{
                print("Abasteceu \(contador + novoValor) litros")
            }
        }
    }
}

let abastecer = Abastecer()
abastecer.contador = 30
abastecer.contador = 50
abastecer.contador = 45

//: **Herança e Polimorfismo**
//Classe Pai / SuperClasse (Humano)
class Humano {
    var nome: String = ""
    var idade: Int = 0
    
    func andar(){
        print("O humano está andando")
    }
}

class Atleta : Humano {
    
}

class Funcionario : Humano{
    
}

let pessoa: Humano = Humano()
pessoa.nome = "Roberto"
print("O Nome da pessoa é \(pessoa.nome)")

let maratonista: Atleta = Atleta()
maratonista.nome = "Leandro"
print("O Nome do atleta é \(maratonista.nome)")

let vendedor: Funcionario = Funcionario()
vendedor.nome = "Gustavo"
print("O nome do funcionário é \(vendedor.nome)")



//: Propriedades Computadas
class Todo {
    var objetivo: Double = 0.0
    var objetivosCompletos: Double = 0.0
    
    var porcentagem: Double {
        get {
            return objetivosCompletos/objetivo * 100
        }
        set(novaPorcentagemCompleta){
            objetivosCompletos = objetivo * (novaPorcentagemCompleta/100)
        }
    }
    var objetivosFaltando: Double {
        get {
            return objetivo - objetivosCompletos
        }
        set(novosObjetivosFaltando){
            objetivosCompletos = objetivo - novosObjetivosFaltando
        }
    }
    
    init(){
        print("Só iniciando")
    }
    
    init(obj: Double){
        objetivo = obj
    }
    
    init(obj: Double, completos: Double){
        objetivo = obj
        objetivosCompletos = completos
    }
}

var tarefasLeandro: Todo = Todo(obj: 20)
tarefasLeandro.porcentagem
tarefasLeandro.objetivosFaltando
tarefasLeandro.objetivosFaltando

//: [Ir para Optionals](@next)
