//: Playground - noun: a place where people can play

import UIKit

class Introduction{
    var name:String!
    var age:Int!
    var born:Int!
    var hometown:String!
    
    class func startIntroduction() {
        print("これから自己紹介をはじめます")
    }
    
    func temp(){
        print("========================")
        print("私の名前は\(name)です")
        print("\(born)年生まれの\(age)歳です")
        print("出身地は\(hometown)です")
        print("=========================")
        print("よろしくお願いします！")
    }
    
    init() {
        print("こんにちは") //=> こんにちは
    }
}

class Introduction2: Introduction{
    override func temp() {
        print("クラスを継承することができた") //=>クラスを継承することができた
    }
}

var intro = Introduction2()
intro.temp()
