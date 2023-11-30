//
//  main.swift
//  Lv.3
//
//  Created by 박민정 on 2023/11/30.
//

class Calculator {
    let add = AddOperation()
    let subtract = SubtractOperation()
    let multiply = MultiplyOperation()
    let divide = DivideOperation()
    
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

class AddOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double ) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
        
    }
}

class MultiplyOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation {
    func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

let calculator = Calculator()

let addResult = calculator.calculate("+",1,2)
let subtractResult = calculator.calculate("-",1,2)
let multiplyResult = calculator.calculate("x",1,2)
let divideResult = calculator.calculate("/",1,2)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
