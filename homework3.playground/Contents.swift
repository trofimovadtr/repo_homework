import Foundation
/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
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
struct SportCar {
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
    mutating func ChangeStatusEngine(WhatsUWant: EngineStatus){
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
                
    
    mutating func ChangeStatusWindows(Windows: WindowStatus){
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
        mutating func ChangeStatusTrunk(WhatsUDo: TrunkLoad){
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
var car1 = SportCar(MarkaAuto: "Audi", DataProizvodstva: "08.2015", ObshayaVmestimostBagaja: 80, SostoyanieDvigatelya: .EngineOff, SostoyanieOkon: .Close, TekushayaZagruzkaBagajnika: 20)
car1.ChangeStatusWindows(Windows: .Close)
print(car1.Windows)
car1.ChangeStatusTrunk(WhatsUDo: .unload(volume: 50))
print(car1.TrunkNow)
car1.ChangeStatusEngine(WhatsUWant: .EngineOn)
car1.printAuto()
