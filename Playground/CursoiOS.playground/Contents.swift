//declaracao de variavel
let laranja = 3

let melancia = 0.5

var uva: Int = 1

print("Eu tenho \(laranja) laranjas")

let frutas = Double(laranja) + melancia + Double(uva)

uva = 2

let array = [Double(laranja), melancia, Double(uva)]

//FILTRAR ARRAY

//array
var nomes: [String] = ["Emanuel"]

nomes.append("Rodrigo")
nomes.append("André")
nomes.append("Bryan")

for nome in nomes {
    print(nome)
}

print(nomes)

//FOR DECREMENTANDO

for index in 0...nomes.count-1 {
    print(nomes[index])
}

//optional
var optional: String?
if let nome = optional {
    print(nome)
}

optional = "Bruno"
print(optional)

if optional != nil {
    print(optional!)
}

if let nome = optional {
    print(nome)
}

//switch case
switch optional! {
    case "Rodrigo":
        print("Rodrigo")
    
    case "André":
        print("André")
    
    default:
        print(optional)
}

//dictionary
var dicionario = [String: String]()
dicionario["nome"] = "Rodrigo"
dicionario["idade"] = "28"
dicionario["email"] = "rodrigo.vcavalcante@gmail.com"

print(dicionario)

for (key, value) in dicionario {
    print("key \(key) value \(value)")
}

//dictionary [String, [String, String]]
let dic = ["Usuario": dicionario, "Endereco": ["Rua": "Joao Balbi", "Numero": "753"]]
print(dic)

//declaracao de funcao/metodos
func soma (a: Int, b: Int) -> Int {
    return a+b
}

//PASSAR POR REFERENCIA
soma(5, b: 6)

//tuples
func SSMD (a: Int, b: Int) -> (soma: Int, subtrai: Int, multiplica: Int, divide: Int) {
    return (a+b, a-b, a*b, a/b)
}

let ssmd = SSMD(10, b:2)
ssmd.0
ssmd.soma
ssmd.subtrai
ssmd.multiplica
ssmd.divide

//classes
class PessoaClass {
    var nome: String?
    var idade: Int?
    var email: String //sem ? e !
    
    init() {
        email = ""
    }
}

var p = PessoaClass()
p.nome = "Rodrigo"
p.idade = 28
p.email = "rodrigo.vcavalcante@gmail.com"

var p2 = p
p2.nome = "Cavalcante"

print(p2.nome)
print(p.nome)

//diferencao entre classe e struct
struct PessoaStruct {
    var nome: String?
    var idade: Int?
    var email: String

    init() {
        email = ""
    }
    
    init(nome: String, idade: Int, email: String) {
        self.nome = nome
        self.idade = idade
        self.email = email
    }

}

var s = PessoaStruct(nome: "Rodrigo", idade: 28, email: "rodrigo.vcavalcante@gmail.com")
var s2 = s
s2.nome = "Cavalcante"

print(s2.nome)
print(s.nome)

//heranca
class Trabalhador: PessoaClass {
    var cargo: String?
}

let t = Trabalhador()
t.nome = "Rodrigo"
t.cargo = "Desenvolvedor iOS"

//protocol / interface
protocol TrabalhadorProtocol {
    func getCargo() -> String
}

//category
extension Trabalhador: TrabalhadorProtocol {
    func getCargo() -> String {
        if let c = cargo {
            return c
        }
        
        return ""
    }
}

t.getCargo()

extension Int: TrabalhadorProtocol {
    func getCargo() -> String {
        return "Inteiro não tem cargo"
    }
}

laranja.getCargo()

//enum
enum Cargos /*: Int*/ {
    case DESENVOLVEDOR// = 0
    case ANALISTA// = 1
    case GERENTE// = 2
    
    func getDescricao() -> String {
        switch self {
        case .DESENVOLVEDOR:
            return "desenvolvedor"
            
        case .ANALISTA:
            return "analista"
            
        case .GERENTE:
            return "gerente"
        }
    }
}

let cargo = Cargos.DESENVOLVEDOR
cargo.getDescricao()

//generic
func imprime<T>(a: T) {
    print("T: \(a)")
}

imprime(laranja)
imprime(optional)
imprime(nomes)

//closure
func closure(completion: (result: Int) -> Void) {
    completion(result: 100)
}

closure { (result) in
    print(result)
}
