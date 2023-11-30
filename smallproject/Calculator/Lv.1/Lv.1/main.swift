//
//  main.swift
//  Lv.1
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

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
