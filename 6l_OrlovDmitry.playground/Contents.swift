import UIKit

protocol Money {
    var money: Int { get set }
}

class BeerLover: Money {

    var volume: Double
    var name: String
    var beer: String
    var money: Int
    
    
    init(name: String, beer: String, volume: Double, money: Int) {
        self.name = name
        self.beer = beer
        self.volume = volume
        self.money = money
    }
    
    func clientInfo() {
        print("Посетитель \(name) желает купить \(volume) литра пива \"\(beer)\" на сумму \(money).")
    }
}

class PoliceCheck: Money {
    
    var name: String
    var reason: String
    var money: Int
    
    init(name: String, reason: String, money: Int) {
        self.name = name
        self.reason = reason
        self.money = money
    }
    
    func policeReport() {
        print("Офицер \(name) обнаружил нарушение закона: \(reason), и наложил штраф в размере \(money) рублей.")

    }
}

struct QueueToBeerHouse<T: Money> {
    private var elements: [T] = []
    mutating func push (_ element: T) {
        elements.append(element)
    }
    mutating func remove () -> T? {
        return elements.removeFirst()
    }

}

var aNewQueue = QueueToBeerHouse<BeerLover>()

aNewQueue.push(BeerLover(name: "Петр-опохмел", beer: "Охота крепленое", volume: 0.5, money: 90))
aNewQueue.push(BeerLover(name: "Колян-пижон", beer: "светлое нефильтрованое", volume: 1, money: 500))
aNewQueue.push(BeerLover(name: "Серега-худой", beer: "Балтика", volume: 1.5, money: 200))
//aNewQueue.remove()




