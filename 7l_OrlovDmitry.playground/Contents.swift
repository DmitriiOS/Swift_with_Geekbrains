import UIKit

enum GenieError: Error {
    case ДжинНеЗнаетТакоеЖелание
    case ДляЭтогоЖеланияВамНужноБольше (requirements: String)
    case ЖеланияКончились
}

struct Wish {
    var requirement: String
    var cost: Int
}

class Genie {
    var wishList = [
        "Машина": Wish(requirement: "Водительские права", cost: 1),
        "Квартира": Wish(requirement: "Паспорт", cost: 1),
        "Работа": Wish(requirement: "Знания", cost: 1)
    ]
    
    var numberOfWishes = 3
    
    func iWish(a wish: String, i have: String) throws {
        guard let myWish = wishList[wish] else {
            throw GenieError.ДжинНеЗнаетТакоеЖелание
        }
        guard myWish.requirement == have else {
            throw GenieError.ДляЭтогоЖеланияВамНужноБольше(requirements: myWish.requirement)
        }
        guard myWish.cost <= numberOfWishes else {
            throw GenieError.ЖеланияКончились
        }
        
        numberOfWishes -= myWish.cost
        
        let completedWish = myWish
        wishList[wish] = completedWish
        
        print("Ваше желание \(wish) исполнено!")
    }
}

var aladdin = Genie()

try? aladdin.iWish(a: "Машина", i: "Водительские права")
try? aladdin.iWish(a: "Работа", i: "jgjg")
try? aladdin.iWish(a: "Квартира", i: "Паспорт")
try? aladdin.iWish(a: "Машина", i: "Водительские права")
try? aladdin.iWish(a: "Квартира", i: "Паспорт")

do {
    try aladdin.iWish(a: "Работа", i: "Знания")
    print("okey")
} catch GenieError.ДжинНеЗнаетТакоеЖелание {
    print("bad wish")
} catch GenieError.ДляЭтогоЖеланияВамНужноБольше(let requirements) {
    print("you need more \(requirements)")
} catch GenieError.ЖеланияКончились {
    print("no more wishes")
} catch {
    print("UNEXPECTED ERROR")
}



