//: [Voltar para Optionals](@previous)
//*: ### Type Casting e DownCasting
//: **Operador is**
var seraArray: Array = ["Gervásio", "Lindoelma", "Mummy"]

seraArray is Array
//Resultado: true

seraArray is String
//Resultado: false

seraArray is Int
//Resultado: false


//: **Downcasting com o operador as**
var numeroTexto: [String:Any?] = ["nome": "Leleco", "idade": 20, "profissao": 10]

numeroTexto["nome"] as! String
numeroTexto["idade"] as? Int
numeroTexto["profissao"] as? Int

if let nome = numeroTexto["nome"] as? String {
   print("Olha o nome aí \(nome)")
}else{
    print("Falhou")
}


