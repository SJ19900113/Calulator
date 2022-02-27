//
//  CalculatorEngine.swift
//  Calulator
//
//  Created by Shejun on 2022/2/27.
//

import Foundation

class CalculatorEngine: NSObject {
    let funcArray:CharacterSet = ["+","-","*","/","%","^"];
    
    func calculatEquation(equation:String) -> Double {
        let elmentArray = equation.components(separatedBy: funcArray);
        var tip = 0;
        var result:Double = Double(elmentArray[0])!;
        
        for char in equation {
            switch char {
            case "+":
                tip += 1;
                if elmentArray.count > tip {
                    result += Double(elmentArray[tip])!;
                }
            case "-":
                tip += 1;
                if elmentArray.count > tip {
                    result -= Double(elmentArray[tip])!;
                }
            case "*":
                tip += 1;
                if elmentArray.count > tip {
                    result *= Double(elmentArray[tip])!;
                }
            case "/":
                tip += 1;
                if elmentArray.count > tip {
                    result /= Double(elmentArray[tip])!;
                }
            case "%":
                tip += 1;
                if elmentArray.count > tip {
                    result = Double(Int(result) % Int(elmentArray[tip])!);
                }
            case "^":
                tip += 1;
                if elmentArray.count > tip {
                    let tmp = result;
                    for _ in 1..<Int(elmentArray[tip])! {
                        result *= tmp
                    }
                }
            default:
                break;
            }
        }
        return result;
    }
}
