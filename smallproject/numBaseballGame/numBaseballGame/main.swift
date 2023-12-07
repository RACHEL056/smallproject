//
//  main.swift
//  numBaseballGame
//
//  Created by 박민정 on 2023/12/05.

import Foundation

//에러처리
enum gameError : Error {
    case invalidLength //3자리 이상의 수 입력한 경우
    case duplicateDigits //중복된 숫자 들어올 경우
//    case containZero //0을 가지고 있는 경우
    case nonNumeric //문자 들어올 경우
    case startwithZero //0으로 시작하는 경우
}

//랜덤으로 답 만드는 기능
func RandomAnswer() -> String {
    var digits = Set<Character>("0123456789")
    var randomString = ""
    
    for _ in 0..<3 {
        let digit = digits.randomElement()!
        digits.remove(digit) //중복되지 않은 숫자 나오게 하기 위해서 지워줌
        randomString.append(digit)
    }
    
    return randomString
}

//스트라이크, 볼 판별하는 기능
func Hint(answer: String, guess: String) -> (strikes: Int, balls: Int) {
    var strikes = 0
    var balls = 0
    
    //guess.enumerated는 현재 문자와 문자의 인덱스를 함께 제공
    for (index, digit) in guess.enumerated() {
        let answerIndex = answer.index(answer.startIndex, offsetBy: index)
        
        if answer.contains(digit) {
            if answer[answerIndex] == digit {
                strikes += 1
            } else {
                balls += 1
            }
        }
    }
    
    return (strikes, balls)
}

//throw를 통해 에러 검출
func isValid(_ input: String) throws {
    guard input.count == 3 else {
        throw gameError.invalidLength
    }
    
    //set을 통해 중복된 수 없애기, 이후 문자열의 수가 줄어드는 것을 통해 중복된 수 유무 확인
    let uniqueDigits = Set(input)
    guard uniqueDigits.count == 3 else {
        throw gameError.duplicateDigits
    }
    
    guard let _ = Int(input) else {
        throw gameError.nonNumeric
    }
    
    guard !input.hasPrefix("0") else {
        throw gameError.startwithZero
    }
}


//실행화면
func main() {
    let answer = RandomAnswer()
    
    print("<게임을 시작합니다>")
    
    repeat {
        print("숫자를 입력하세요")
        do {
            if let input = readLine() {
                try isValid(input)
                let hint = Hint(answer: answer, guess: input)
                
                if hint.strikes == 0 && hint.balls == 0 {
                    print("Nothing")
                } else{
                    print("\(hint.strikes) 스트라이크, \(hint.balls) 볼")
                }
                
                if hint.strikes == 3 {
                    print("정답입니다!")
                    break
                }
            }
        } catch gameError.invalidLength {
            print("올바르지 않은 입력값입니다")
        } catch gameError.duplicateDigits {
            print("올바르지 않은 입력값입니다")
        } catch gameError.startwithZero {
            print("올바르지 않은 입력값입니다")
        } catch {
            print("알 수 없는 오류 발생")
        }
    } while true
}

main()
