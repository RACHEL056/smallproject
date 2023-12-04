//
//  main.swift
//  Lv.4
//
//  Created by 박민정 on 2023/12/04.
// 프로토콜을 배우지 않아 클래스의 상속으로 처리

class AbstractOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return 0
    }
}

class AddOperation : AbstractOperation {
    override func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubtractOperation : AbstractOperation {
    override func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
        
    }
}

class MultiplyOperation : AbstractOperation {
    override func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivideOperation : AbstractOperation {
    override func operate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}

class Calculator {
    var abstractOperation : AbstractOperation
    
    init(operation: AbstractOperation) {
        self.abstractOperation = operation
    }
    
    func setOperation(operation: AbstractOperation) {
        self.abstractOperation = operation
    }
    
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        abstractOperation.operate(_ : firstNumber, _ : secondNumber)
    }
}

let calculator = Calculator(operation: AddOperation())

let addResult = calculator.calculate(10, 20)

calculator.setOperation(operation: SubtractOperation())
let subtractResult = calculator.calculate(30, 20)

calculator.setOperation(operation: MultiplyOperation())
let multiplyResult = calculator.calculate(10, 5)

calculator.setOperation(operation: DivideOperation())
let divideResult = calculator.calculate(40, 10)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
