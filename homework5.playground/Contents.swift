
import Foundation
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
/*1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.*/
protocol Car {
    var label: String {get}
    var date: String {get}
    var TrunkVol: Double {get}
    var Engine: EngineStatus {get set}
    var Windows: WindowStatus {get set}
    var TrunkNow: Double {get set}
    func ChangeStatusTrunk(WhatsUDo: TrunkLoad)
    
}
extension Car{
    mutating func ChangeStatusEngine(WhatsUWant: EngineStatus) -> String {
            if (self.Engine == .EngineOff) && (WhatsUWant == .EngineOn) {
                self.Engine = .EngineOn
                return Engine.rawValue
            }
            else if (self.Engine == .EngineOn) && (WhatsUWant == .EngineOn){
                return "Двигатель уже запущен"
            }
            else if (self.Engine == .EngineOff) && (WhatsUWant == .EngineOff) {
                return "Двигатель итак не запущен"
            }
            else {
                self.Engine = .EngineOff
                return Engine.rawValue
            }
        }
    mutating func ChangeStatusWindows(Windows: WindowStatus)-> String {
        if (self.Windows == .Open)&&(Windows == .Open) {
            return "Окна уже открыты"
        }
        else if (self.Windows == .Close)&&(Windows == .Close){
            return "Окна уже закрыты"
        }
        else if (self.Windows == .Close)&&(Windows == .Open){
            self.Windows = .Open
            return "Вы открыли окна"
        }
        else {
            self.Windows = .Close
            return "Вы закрыли окна"
        }
    }
    func printAuto(){
        print("Марка автомобиля:\(label)\nДата изготовления:\(date)\nВместимость багажника:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ багажнике \(TrunkNow) кг груза")
    }
    }
class TrunkCar: Car{
    var date: String
    var Engine: EngineStatus
    var label: String
    var TrunkNow: Double
    var TrunkVol: Double
    var Windows: WindowStatus
    var CargoType: LorryTypes
    var Trailer: TrailerStatus
    init (MarkaAuto: String, DataProizvodstva: String, ObshayaVmestimostBagaja: Double, SostoyanieDvigatelya: EngineStatus, SostoyanieOkon: WindowStatus, TekushayaZagruzkaBagajnika: Double, TipGruzovika : LorryTypes, StatusPricepa: TrailerStatus) {
        self.label = MarkaAuto
        self.date = DataProizvodstva
        self.TrunkVol = ObshayaVmestimostBagaja
        self.Engine = SostoyanieDvigatelya
        self.Windows = SostoyanieOkon
        self.TrunkNow = TekushayaZagruzkaBagajnika
        self.CargoType = TipGruzovika
        self.Trailer = StatusPricepa
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
    func ChangeStatusTrunk(WhatsUDo: TrunkLoad){
        print("Проверка загруженности грузовика завершена")
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
}

class SportCar: Car{
    var date: String
    var Engine: EngineStatus
    var label: String
    var TrunkNow: Double
    var TrunkVol: Double
    var Windows: WindowStatus
    var Seats: CountOfSeats
    init(MarkaAuto: String, DataProizvodstva: String, ObshayaVmestimostBagaja: Double, SostoyanieDvigatelya: EngineStatus, SostoyanieOkon: WindowStatus, TekushayaZagruzkaBagajnika: Double, KolichestvoMest: CountOfSeats){
        self.label = MarkaAuto
        self.date = DataProizvodstva
        self.TrunkVol = ObshayaVmestimostBagaja
        self.Engine = SostoyanieDvigatelya
        self.Windows = SostoyanieOkon
        self.TrunkNow = TekushayaZagruzkaBagajnika
        self.Seats = KolichestvoMest
    }
    func ChangeStatusTrunk(WhatsUDo: TrunkLoad){
        print("Проверка загруженности легковой машины завершена")
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
    
}
var mazda = SportCar(MarkaAuto: "mazda", DataProizvodstva: "08.2010", ObshayaVmestimostBagaja: 300, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Close, TekushayaZagruzkaBagajnika: 50.0, KolichestvoMest: .FiveSeats)
var nissan = SportCar(MarkaAuto: "Nissan", DataProizvodstva: "12.2021", ObshayaVmestimostBagaja: 400, SostoyanieDvigatelya: .EngineOn, SostoyanieOkon: .Open, TekushayaZagruzkaBagajnika: 100.0, KolichestvoMest: .TwoSeats)
print(mazda.ChangeStatusWindows(Windows: .Close))
print(mazda.ChangeStatusEngine(WhatsUWant: .EngineOff))
mazda.ChangeStatusTrunk(WhatsUDo: .load(volume: 500))
var kamaz = TrunkCar(MarkaAuto: "kamaz", DataProizvodstva: "08.1980", ObshayaVmestimostBagaja: 5000, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Close, TekushayaZagruzkaBagajnika: 2000, TipGruzovika: .special, StatusPricepa: .HitchedTrailer)
kamaz.ChangeStatusWindows(Windows: .Open)
kamaz.ChangeStatusTrunk(WhatsUDo: .load(volume: 2000))
extension TrunkCar: CustomStringConvertible{
    var description: String {return "Марка грузовика:\(label)\nТип грузовика:\(CargoType.rawValue)\nДата изготовления:\(date)\nВместимость прицепа:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ прицепе \(TrunkNow) кг груза\n\(Trailer.rawValue)\n "}
}
extension SportCar : CustomStringConvertible{
    var description: String {return "Марка автомобиля:\(label)\nДата изготовления:\(date)\n\(Seats.rawValue)\nВместимость багажника:\(TrunkVol)\n\(Engine.rawValue)\n\(Windows.rawValue)\nВ багажнике \(TrunkNow) кг груза"}
}
print(kamaz.description)
print(mazda.description)
print(nissan.ChangeStatusEngine(WhatsUWant: .EngineOff))
nissan.printAuto()
nissan.ChangeStatusTrunk(WhatsUDo: .unload(volume: 99.0))


