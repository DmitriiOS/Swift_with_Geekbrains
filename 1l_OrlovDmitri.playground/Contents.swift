import UIKit

// ax^2 + bx + c = 0

let a: Double = 1
let b: Double = -6
let c: Double = 9

var x1: Double?
var x2: Double?

let d = b*b - 4 * a * c

if d > 0 {
    x1 = (-b + sqrt(d)) / 2 * a
    x2 = (-b - sqrt(d)) / 2 * a
    print("Корня ДВА: \(x1!) и \(x2!)")
} else if d == 0 {
    x1 = (-b + sqrt(d)) / 2 * a
    print("Корень ОДИН: \(x1!)")
    
} else {
    print("Корней НЕТ")
}

// Треугольник

let katet1: Double = 4
let katet2: Double = 7
let gipotenuza = sqrt(katet1 * katet1 + katet2 * katet2)

let perimeter = katet1 + katet2 + gipotenuza

let square = katet1 * katet2 / 2

print("""
    Дан треугольник со сторонами:
    \(katet1) , \(katet2) , \(String(format: "%.2f", gipotenuza))
    Периметр равен: \(String(format: "%.2f", perimeter))
    Площадь равна: \(square)
    """)

// Банк

var sum: Double = 1200
let percent: Double = 7
var year = 1
let years = 5

while year <= years {
    sum = sum / 100 * percent + sum
    year += 1
}
print ("Через \(years) лет ваш вклад будет составлять: \(String(format: "%.2f", sum))")



