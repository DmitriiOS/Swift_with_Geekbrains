import UIKit

struct car {
    var brand: String
    var year: Int
    var trunkVolume: Int
    var engineStarted: Bool
    var windowsOpened: Bool
    var usedTrunkSpace: Int
    
    enum actionVariants {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case putCargo (p: Int)
        case takeCargo (t: Int)
    }
    
    mutating func action(act: actionVariants) {
        switch act {
        case .startEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindow:
            windowsOpened = true
        case .closeWindow:
            windowsOpened = false
        case .putCargo(let p):
            if p <= (trunkVolume - usedTrunkSpace) {
                usedTrunkSpace += p
            }
        case .takeCargo(let t):
            if t <= usedTrunkSpace {
                usedTrunkSpace -= t
            }
        }
    }
    
    func carReport() {
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
        
        print("""
        Ваш автомобиль: \(self.brand), \(self.year) года выпуска,
        двигатель автомобиля \(engineReport), окна \(windowsReport),
        объем багажника: \(self.trunkVolume), из них используется: \(self.usedTrunkSpace)
            
        """)
    }
}


var myCar = car(brand: "Renault", year: 2014, trunkVolume: 300, engineStarted: false, windowsOpened: false, usedTrunkSpace: 0)

var wifeCar = car(brand: "lada", year: 2000, trunkVolume: 200, engineStarted: true, windowsOpened: true, usedTrunkSpace: 0)

myCar.carReport()
myCar.action(act: .openWindow)
myCar.action(act: .startEngine)
myCar.action(act: .putCargo(p: 200))
myCar.carReport()

wifeCar.carReport()
wifeCar.action(act: .closeWindow)
wifeCar.action(act: .stopEngine)
wifeCar.action(act: .putCargo(p: 100))
wifeCar.carReport()




