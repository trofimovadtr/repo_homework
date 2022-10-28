import Foundation
/*1.Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.*/
enum EngineStatus: String {
    case EngineOn = "Двигатель запущен"
    case EngineOff = "Двигатель заглушен"
}
enum WindowStatus: String {
    case Open = "Окна открыты"
    case Close = "Окна закрыты"
}
enum TrunkLoad{
    case load(volume: Double)
    case unload(volume: Double)
}
enum LorryTypes: String{
    case open = "Открытый"
    case close = "Закрытый"
    case special = "Специальный"
}
enum TrailerStatus: String{
    case HitchedTrailer = "Прицеп соединен"
    case UnhitchedTrailer = "Прицеп отсоединен"
}
enum CountOfSeats: String{
    case TwoSeats = "Двухместный"
    case FourSeats = "Четырехместный"
    case FiveSeats = "Пятиместный"
}
class Car {
    let label: String
    let date: String
    let TrunkVol: Double
    var Engine: EngineStatus = .EngineOff
    var Windows: WindowStatus = .Close
    var TrunkNow: Double = 0
    init (MarkaAuto: String, DataProizvodstva: String, ObshayaVmestimostBagaja: Double, SostoyanieDvigatelya: EngineStatus, SostoyanieOkon: WindowStatus, TekushayaZagruzkaBagajnika: Double) {
        self.label = MarkaAuto
        self.date = DataProizvodstva
        self.TrunkVol = ObshayaVmestimostBagaja
        self.Engine = SostoyanieDvigatelya
        self.Windows = SostoyanieOkon
        self.TrunkNow = TekushayaZagruzkaBagajnika
    }
    func ChangeStatusEngine(WhatsUWant: EngineStatus){
        if (self.Engine == .EngineOff) && (WhatsUWant == .EngineOn) {
            self.Engine = .EngineOn
            print(Engine.rawValue)
        }
        else if (self.Engine == .EngineOn) && (WhatsUWant == .EngineOn){
            print("Двигатель уже запущен")
        }
        else if (self.Engine == .EngineOff) && (WhatsUWant == .EngineOff) {
            print("Двигатель итак не запущен")
        }
        else {
            self.Engine = .EngineOff
            print(Engine.rawValue)
        }
    }
    
    
    func ChangeStatusWindows(Windows: WindowStatus){
        if (self.Windows == .Open)&&(Windows == .Open) {
            print("Окна уже открыты")
        }
        else if (self.Windows == .Close)&&(Windows == .Close){
            print("Окна уже закрыты")
        }
        else if (self.Windows == .Close)&&(Windows == .Open){
            self.Windows = .Open
            print("Вы открыли окна")
        }
        else {
            self.Windows = .Close
            print("Вы закрыли окна")
        }
    }
    func ChangeStatusTrunk(WhatsUDo: TrunkLoad){
        switch (self.TrunkNow, WhatsUDo){
        case (0, .unload): print("Нечего выгружать")
        case (_,.unload(let volume)) where volume>self.TrunkNow : print("Текущий объем груза составляет \(self.TrunkNow) кг, запрошенный объем \(volume) кг выгрузить невозможно")
        case (_, .unload(let volume)) :
            self.TrunkNow -= volume
            print("Выгрузка произведена, текущий объем груза составляет \(self.TrunkNow) кг")
        case (_, .load(let volume)) where (self.TrunkNow+volume)>self.TrunkVol : print("Невозможно произвести загрузку. Общая вместимость \(TrunkVol) кг, текущая загрузка \(TrunkNow)")
        case (_,.load(let volume)) where volume<=self.TrunkVol :
            self.TrunkNow += volume
            print("Загрузка произведена.Текущая загрузка багажника составляет \(TrunkNow) кг")
            
        default: print("error")
        }
    }
    func printAuto(){
        print("Марка автомобиля:\(label)\nДата изготовления:\(date)\nВместимость багажника:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ багажнике \(TrunkNow) кг груза")
    }
    
    
}
var car1 = Car(MarkaAuto: "Audi", DataProizvodstva: "08.2015", ObshayaVmestimostBagaja: 80, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Close, TekushayaZagruzkaBagajnika: 20)
car1.ChangeStatusWindows(Windows: .Close)
print(car1.Windows)
car1.ChangeStatusTrunk(WhatsUDo: .unload(volume: 50))
print(car1.TrunkNow)
car1.ChangeStatusEngine(WhatsUWant: .EngineOn)
car1.printAuto()


class LorryCar: Car {
    var CargoType: LorryTypes
    var Trailer: TrailerStatus
    init (MarkaAuto: String, DataProizvodstva: String, ObshayaVmestimostBagaja: Double, SostoyanieDvigatelya: EngineStatus, SostoyanieOkon: WindowStatus, TekushayaZagruzkaBagajnika: Double, TipGruzovika: LorryTypes, SostoyaniePricepa: TrailerStatus){
        self.CargoType = TipGruzovika
        self.Trailer = SostoyaniePricepa
        super.init(MarkaAuto: MarkaAuto, DataProizvodstva: DataProizvodstva, ObshayaVmestimostBagaja: ObshayaVmestimostBagaja, SostoyanieDvigatelya: SostoyanieDvigatelya, SostoyanieOkon: SostoyanieOkon, TekushayaZagruzkaBagajnika: TekushayaZagruzkaBagajnika)
    }
    func ChangeTrailerStatus(WhatUWant: TrailerStatus){
        if WhatUWant == .HitchedTrailer{
            self.Trailer = .HitchedTrailer
            print(self.Trailer.rawValue)
        }
        else if WhatUWant == .UnhitchedTrailer {
            self.Trailer = .UnhitchedTrailer
            print(self.Trailer.rawValue)
        }
    }
    override func printAuto() {
        print("Марка грузовика:\(label)\nТип грузовика:\(CargoType.rawValue)\nДата изготовления:\(date)\nВместимость прицепа:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ прицепе \(TrunkNow) кг груза\n\(Trailer.rawValue)\n ")
    }
}
var kamaz = LorryCar(MarkaAuto: "KAMAZ", DataProizvodstva: "1980", ObshayaVmestimostBagaja: 5000, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Close, TekushayaZagruzkaBagajnika: 2000, TipGruzovika: .open, SostoyaniePricepa: .HitchedTrailer)
kamaz.ChangeTrailerStatus(WhatUWant: .UnhitchedTrailer)
kamaz.ChangeStatusWindows(Windows: .Close)
kamaz.printAuto()
class PassengerCar: Car {
    var Seats: CountOfSeats
    init(MarkaAuto: String, DataProizvodstva: String, ObshayaVmestimostBagaja: Double, SostoyanieDvigatelya: EngineStatus, SostoyanieOkon: WindowStatus, TekushayaZagruzkaBagajnika: Double, KolichestvoMest: CountOfSeats) {
        self.Seats = KolichestvoMest
        super.init(MarkaAuto: MarkaAuto, DataProizvodstva: DataProizvodstva, ObshayaVmestimostBagaja: ObshayaVmestimostBagaja, SostoyanieDvigatelya: SostoyanieDvigatelya, SostoyanieOkon: SostoyanieOkon, TekushayaZagruzkaBagajnika: TekushayaZagruzkaBagajnika)
    }
    override func printAuto() {
        print("Марка автомобиля:\(label)\nДата изготовления:\(date)\n\(Seats.rawValue)\nВместимость багажника:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ багажнике \(TrunkNow) кг груза")
    }
}
var MAZDA = PassengerCar(MarkaAuto: "Mazda", DataProizvodstva: "08.2010", ObshayaVmestimostBagaja: 300, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Open, TekushayaZagruzkaBagajnika: 50, KolichestvoMest: .TwoSeats)
MAZDA.printAuto()



