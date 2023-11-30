//
//  main.swift
//  Lv.2
//
//  Created by 박민정 on 2023/11/30.
//

import Foundation

class Calculator {
    func calculate(_ operator : String, _ firstNumber : Double, _ secondNumber : Double) -> Double {
        
        
        //예약어 에러, 기호는 backtic, 즉 operator을 예약어로 인지하고 있어서 에러뜸
        switch `operator` {
        case "+" :
            return firstNumber + secondNumber
        case "-" :
            return firstNumber - secondNumber
        case "x" :
            return firstNumber * secondNumber
        case "/" :
            if secondNumber != 0{
                return firstNumber / secondNumber
            }else{
                print("0으로는 나눌 수 없습니다!")
                return 0
            }
        case "%" :
            if secondNumber != 0{
                return Double(Int(firstNumber) % Int(secondNumber))
            }else{
                print("0으로는 나눌 수 없습니다!")
                return 0
            }
        case "^" :
            var result = firstNumber
            let range = Int(secondNumber)
            for i in 1...(range-1){
                result *= firstNumber
            }
            return result
        default :
            print("잘못 입력했습니다.")
                return 0
        }
    }
}

let calculator = Calculator()
let addResult = calculator.calculate("+",1,2)
let subtractResult = calculator.calculate("-",1,2)
let multiplyResult = calculator.calculate("x",1,2)
let divideResult = calculator.calculate("/",1,2)
let remainderResult = calculator.calculate("%", 1, 2)
let squareResult = calculator.calculate("^", 2, 2)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("reaminderResult :  \(remainderResult)")
print("squreResult :  \(squareResult)")
