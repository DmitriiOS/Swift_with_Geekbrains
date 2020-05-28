import UIKit

protocol Car {
    var windows: String {get set}
    var engine: String {get set}
    var year: Int {get}
    var maxSpeed: Int {get}
    
    func info()
}

extension Car {
    
    mutating func openWindows() {
        windows = "открыты"
    }
    
    mutating func closeWindows() {
        windows = "закрыты"
    }
    
    mutating func startEngine() {
        engine = "запущен"
    }
    
    mutating func stopEngine() {
        engine = "заглушен"
    }
}

class TrunkCar: Car {
    
    var windows: String
    var engine: String
    var year: Int
    var maxSpeed: Int
    
    var additionalEquipment: equipment
    
    enum equipment {
        case лебедка, прицеп, манипулятор
    }
    
    init(windows: String, engine: String, year: Int, maxSpeed: Int, additionalEquipment: equipment) {
        self.windows = windows
        self.engine = engine
        self.year = year
        self.maxSpeed = maxSpeed
        self.additionalEquipment = additionalEquipment
    }
    
    func info() {
        let info = "Год: \(year), Скорость: \(maxSpeed), Окна: \(windows), Двигатель: \(engine), Дополнительное оборудование: \(additionalEquipment)"
        print (info)
    }
}

class SportCar: Car {
    
    var windows: String
    var engine: String
    var year: Int
    var maxSpeed: Int
    
    var drivingWheels: drivingWheelsOptions
    
    enum drivingWheelsOptions {
        case передний, задний, полный
    }
    
    init(windows: String, engine: String, year: Int, maxSpeed: Int, drivingWheels: drivingWheelsOptions) {
        self.windows = windows
        self.engine = engine
        self.year = year
        self.maxSpeed = maxSpeed
        self.drivingWheels = drivingWheels
    }
    
    func info() {
        let info = "Год: \(year), Скорость: \(maxSpeed), Окна: \(windows), Двигатель: \(engine), Привод: \(drivingWheels)"
        print (info)
    }
}

var kamaz = TrunkCar(windows: "открыты", engine: "запущен", year: 1986, maxSpeed: 150, additionalEquipment: .прицеп)
var lada = SportCar(windows: "закрыты", engine: "запущен", year: 2000, maxSpeed: 160, drivingWheels: .передний)

kamaz.info()
kamaz.closeWindows()
kamaz.stopEngine()
kamaz.info()

lada.info()
lada.openWindows()
lada.stopEngine()
lada.info()





