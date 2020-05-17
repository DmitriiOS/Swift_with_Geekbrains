import UIKit

// Задание 1

func evenNumber (_ number: Int) -> Bool {
    //четное - true, нечетное - false
    let answer = number % 2 == 0 ? true : false
    return answer
}

evenNumber(4)

// Задание 2

func devideByThree (_ number: Int) -> Bool {
    // если делится без остатка - true, если нет - false
    let answer  = number % 3 == 0 ? true : false
    return answer
}

devideByThree(5)

// Задание 3

var array100: [Int] = []

for i in 0...99 {
    array100.append(i)
}

print(array100)

// Задание 4

for n in array100 {
    if !devideByThree(n) || !evenNumber(n) {
        array100.remove(at: array100.firstIndex(of: n)!)
    }
}

print(array100)



