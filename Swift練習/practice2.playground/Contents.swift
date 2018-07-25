//: Playground - noun: a place where people can play

import UIKit

//func hello(){
   // print("Hello World")
//}
//hello()

func hello(name: String){
    print("\(name)さん、こんにちは")
}
hello(name: "シンボ")

func greet(hour: Int){
    if(hour >= 5 && hour <= 10){
      print("おはようございます")
    }else if(hour >= 11 &&  hour <= 17){
        print("こんにちは")
    }else{
        print("こんばんは")
    }
}
greet(hour: 19)

func square(x: Int) -> Int{
    let result = x * x
    return result
}
let sum = square(x: 5) + square(x: 10)
print("5の2乗と10の2乗の合計は\(sum)です")

func Sum(num1: Int, num2: Int) -> Int{
    return num1 + num2
    }

let num = Sum(num1: 5, num2: 10)
print(num)


