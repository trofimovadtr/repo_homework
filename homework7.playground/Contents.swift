import Foundation

/*1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.*/

struct Jeans: Hashable {
    var name: String
    var JeansSize: Int
    var PriceOfJeans: Double
}
enum SaleErrors:Error{
    case InvalidSelection
    case NoSizeInStock
    case NoMoney
}
enum printErrors:Error{
    case InvalidInfo
}

class JeansMagazine{
    var JeansInStock = [
        "Regular fit": Jeans(name: "Regular fit", JeansSize: 32, PriceOfJeans: 99.9),
        "Wide leg": Jeans(name: "Wide leg", JeansSize: 26, PriceOfJeans: 80.9),
        "Jeggings Fir": Jeans(name: "Jeggings Fir", JeansSize: 30, PriceOfJeans: 70.5),
        "Boyfriend fit": Jeans(name: "Boyfriend fit", JeansSize: 34, PriceOfJeans: 91.9)]
    /*init(JeansInStock: [String: Jeans]){
        self.JeansInStock = JeansInStock
    }*/
    func BuyingJeans(Request: Jeans) -> (DealComplited:Bool, SaleErrors?){
        guard let index=JeansInStock[Request.name] else {
            return (false, SaleErrors.InvalidSelection)
        }
        guard index.JeansSize == Request.JeansSize else{
            return (false, SaleErrors.NoSizeInStock)
        }
        guard Request.PriceOfJeans >= index.PriceOfJeans else{
            return (false, SaleErrors.NoMoney)
        }
        JeansInStock[Request.name] = nil
        
        return (true, nil)
    }
    
}
 

    
var requestOne = Jeans(name: "Jeggings Fir", JeansSize: 30, PriceOfJeans: 70.5)
var store = JeansMagazine()
var Result = store.BuyingJeans(Request: requestOne)
if Result.0 == true {
    print("Thx for buying in our store")
    print("In stock:\(store.JeansInStock)")
}
else {
    print("Something wrong: \(Result.1!)")
}

/*2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch*/

class SecondJeansMagazine{
    var JeansInStock = [
        "Regular fit": Jeans(name: "Regular fit", JeansSize: 32, PriceOfJeans: 99.9),
        "Wide leg": Jeans(name: "Wide leg", JeansSize: 26, PriceOfJeans: 80.9),
        "Jeggings Fir": Jeans(name: "Jeggings Fir", JeansSize: 30, PriceOfJeans: 70.5),
        "Boyfriend fit": Jeans(name: "Boyfriend fit", JeansSize: 34, PriceOfJeans: 91.9)]
    
    func BuyingJeans(Request: Jeans) throws {
        guard let index = JeansInStock[Request.name] else {
            throw SaleErrors.InvalidSelection
        }
        guard index.JeansSize == Request.JeansSize else{
            throw SaleErrors.NoSizeInStock
        }
        guard Request.PriceOfJeans >= index.PriceOfJeans else{
            throw SaleErrors.NoMoney
        }
        print("thx you for buying \(index.name)")
        JeansInStock[Request.name] = nil
    }
    func printInfo(request: String) throws{
        guard let index = JeansInStock[request] else{
            throw printErrors.InvalidInfo
        }
        print("model: \(index.name)\nSize: \(index.JeansSize)\nPrice:\(index.PriceOfJeans)$")
    }
    
}
var request = Jeans(name: "Jeggings Fir", JeansSize: 30, PriceOfJeans: 70.5)
var SecondStore = SecondJeansMagazine()
do{
    try SecondStore.BuyingJeans(Request: request)
}
catch SaleErrors.InvalidSelection {
    print("Нет такой модельки")
}
catch SaleErrors.NoSizeInStock {
    print("Нет указанного размера этой модели в наличии")
}
catch SaleErrors.NoMoney {
    print("Нужно больше золота")
}
do {
    try SecondStore.printInfo(request: "Boyfriend fit")
}
catch printErrors.InvalidInfo{
    print("No items in stock")
}

