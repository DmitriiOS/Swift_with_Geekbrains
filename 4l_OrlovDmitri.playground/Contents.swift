import UIKit

class Car {
    var model: String
    var year: Int
    var fuelTankVolume: Int
    var maxSpeed: Int
    var numberOfAccidents: Int
    var engineStarted: Bool
    var windowsOpened: Bool
    
    init(model: String, year: Int, fuelTankVolume: Int, maxSpeed: Int, numberOfAccidents: Int, engineStarted: Bool, windowsOpened: Bool) {
        self.model = model
        self.year = year
        self.fuelTankVolume = fuelTankVolume
        self.maxSpeed = maxSpeed
        self.numberOfAccidents = numberOfAccidents
        self.engineStarted = engineStarted
        self.windowsOpened = windowsOpened
    }
    
    func action () {
    }
      
    func carInfo() {
        var engineReport: String
        var windowsReport: String

        if engineStarted == true {
            engineReport = "запущен"
        } else {
            engineReport = "заглушен"
        }

        if windowsOpened == true {
            windowsReport = "открыты"
        } else {
            windowsReport = "закрыты"
        }
        print("Автомобиль марки: \(model)\nГод выпуска: \(year)\nОбъем бензобака: \(fuelTankVolume)\nМаксимальная скорость: \(maxSpeed)\nКоличество ДТП: \(numberOfAccidents)\nДвигатель автомобиля: \(engineReport)\nОкна: \(windowsReport)")
      }
}

class RacingCar: Car {
    var timeTo100kmh: Double
    var nitroAvailable: Bool
    
    init(model: String, year: Int, fuelTankVolume: Int, maxSpeed: Int, timeTo100kmh: Double, nitroAvailable: Bool, numberOfAccidents: Int, engineStarted: Bool, windowsOpened: Bool) {
        self.timeTo100kmh = timeTo100kmh
        self.nitroAvailable = nitroAvailable
        
        super.init(model: model, year: year, fuelTankVolume: fuelTankVolume, maxSpeed: maxSpeed, numberOfAccidents: numberOfAccidents, engineStarted: engineStarted, windowsOpened: windowsOpened)
    }
    
    enum actionVariants {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case addAccident (a: Int)
        case addNitro
        case cancelNitro
    }

    func action (act: actionVariants) {
        switch act {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindow:
            windowsOpened = true
        case .closeWindow:
            windowsOpened = false
        case .addAccident(let accident):
            numberOfAccidents += accident
        case .addNitro:
            nitroAvailable = true
        case .cancelNitro:
            nitroAvailable = false
        }
    }
    
    override func carInfo() {
        var engineReport: String
        var windowsReport: String
        var nitro: String

        if engineStarted == true {
            engineReport = "запущен"
        } else {
            engineReport = "заглушен"
        }

        if windowsOpened == true {
            windowsReport = "открыты"
        } else {
            windowsReport = "закрыты"
        }
        
        if nitroAvailable {
            nitro = "Да"
        } else {
            nitro = "Нет"
        }
        print("Автомобиль марки: \(model)\nГод выпуска: \(year)\nОбъем бензобака: \(fuelTankVolume)\nМаксимальная скорость: \(maxSpeed)\nРазгон до 100 км/ч: \(timeTo100kmh)\nЕсть закись азота? \(nitro)\nКоличество ДТП: \(numberOfAccidents)\nДвигатель: \(engineReport)\nОкна: \(windowsReport)")
    }
}

class TruckCar: Car {
    enum equipment: String {
        case pritsep = "Прицеп"
        case lebedka = "Лебедка"
        case manipulator = "Манипулятор"
    }
    
    enum wheels: Int {
        case four = 4
        case six = 6
        case eight = 8
    }
    
    var additionalEquip: equipment
    var numberOfWheels: wheels
    
    init(model: String, year: Int, fuelTankVolume: Int, maxSpeed: Int, additionalEquip: equipment, numberOfWheels: wheels, numberOfAccidents: Int, engineStarted: Bool, windowsOpened: Bool) {
        self.additionalEquip = additionalEquip
        self.numberOfWheels = numberOfWheels
        
        super.init(model: model, year: year, fuelTankVolume: fuelTankVolume, maxSpeed: maxSpeed, numberOfAccidents: numberOfAccidents, engineStarted: engineStarted, windowsOpened: windowsOpened)
    }
    
    enum actionVariants {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case addAccident (a: Int)
        case numberOfWheels (w: wheels)
        case additionalEquipment (e: equipment)
    }

    func action (act: actionVariants) {
        switch act {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindow:
            windowsOpened = true
        case .closeWindow:
            windowsOpened = false
        case .addAccident(let accident):
            numberOfAccidents += accident
        case .numberOfWheels(let number):
            numberOfWheels = number
        case .additionalEquipment(let equip):
            additionalEquip = equip
        }
    }
    
    override func carInfo() {
        print("Автомобиль марки: \(model)\nГод выпуска: \(year)\nОбъем бензобака: \(fuelTankVolume)\nМаксимальная скорость: \(maxSpeed)\nДополнительное оборудование: \(additionalEquip.rawValue)\nКоличество колес: \(numberOfWheels.rawValue)\nКоличество ДТП: \(numberOfAccidents)")
    }
}

var racer = RacingCar(model: "ferrari", year: 2010, fuelTankVolume: 60, maxSpeed: 230, timeTo100kmh: 5.4, nitroAvailable: true, numberOfAccidents: 0, engineStarted: true, windowsOpened: false)

var winner = RacingCar(model: "ford mustang", year: 2000, fuelTankVolume: 70, maxSpeed: 240, timeTo100kmh: 4.6, nitroAvailable: false, numberOfAccidents: 1, engineStarted: true, windowsOpened: true)

var kamaz = TruckCar(model: "Камаз", year: 1999, fuelTankVolume: 150, maxSpeed: 120, additionalEquip: .pritsep, numberOfWheels: .six, numberOfAccidents: 0, engineStarted: true, windowsOpened: true)

var farmer = TruckCar(model: "Volvo", year: 2005, fuelTankVolume: 200, maxSpeed: 140, additionalEquip: .manipulator, numberOfWheels: .eight, numberOfAccidents: 2, engineStarted: false, windowsOpened: false)

racer.carInfo()
winner.carInfo()
kamaz.carInfo()
farmer.carInfo()

racer.action(act: .cancelNitro)
winner.action(act: .stopEngine)

racer.carInfo()
winner.carInfo()


