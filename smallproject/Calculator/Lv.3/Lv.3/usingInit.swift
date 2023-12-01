//
//  usingInit.swift
//  Lv.3
//
//  Created by 박민정 on 2023/12/01.
//다음의 코드는 기존 코드에서 initializer을 사용하기 위해 변형한 코드이다. 

import Foundation
class Calculator2 {
    let add : AddOperation2
    let subtract : SubtractOperation2
    let multiply : MultiplyOperation2
    let divide : DivideOperation2
    
    init(add: AddOperation2, subtract: SubtractOperation2, multiply: MultiplyOperation2, divide: DivideOperation2) {
        self.add = add
        self.subtract = subtract
        self.multiply = multiply
        self.divide = divide
    }
    
    func calculate(_ operator: String,_ firstNumber: Double,_ secondNumber: Double) -> Double {
        switch `operator` {
        case "+" :
            return add.operate(firstNumber,secondNumber)
        case "-" :
            return subtract.operate(firstNumber, secondNumber)
        case "x" :
            return multiply.operate(firstNumber, secondNumber)
        case "/" :
            if secondNumber != 0{
                return divide.operate(firstNumber, secondNumber)
            }else{
                print("0으로는 나눌 수 없습니다!")
                return 0
            }
        default :
            print("잘못 입력했습니다.")
                return 0
        }
    }
}

class AddOperation2 {
    func operate(_ firstNumber: Double,_ secondNumber: Double ) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation2 {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
        
    }
}

class MultiplyOperation2 {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation2
{
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

let calculator2 = Calculator2(add: AddOperation2(), subtract: SubtractOperation2(), multiply: MultiplyOperation2(), divide: DivideOperation2())

let addResult2 = calculator2.calculate("+",1,2)
let subtractResult2 = calculator2.calculate("-",1,2)
let multiplyResult2 = calculator2.calculate("x",1,2)
let divideResult2 = calculator2.calculate("/",1,2)

//print("addResult : \(addResult2)")
//print("subtractResult : \(subtractResult2)")
//print("multiplyResult : \(multiplyResult2)")
//print("divideResult : \(divideResult2)")
