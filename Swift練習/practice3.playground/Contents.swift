//: Playground - noun: a place where people can play

import UIKit

class Introduction{
    //変数定義
    var name:String //= ""
    var age:Int //= 0
    var born:Int //= 0
    var hometown:String //= ""
    class func startIntroduction(){
        print("これから自己紹介を始めます")
    }
    //実行する内容
    func temp(){
        print("========================")
        print("私の名前は\(name)です")
        print("\(born)年生まれの\(age)歳です")
        print("=========================")
        print("出身地は\(hometown)です")
        print("よろしくお願いします！")
    }
    init(name:String, age:Int, born:Int, hometown:String){
        print("こんにちは")
        self.name = name
        self.age = age
        self.born = born
        self.hometown = hometown
    }
}



//インスタンスの生成
var intro = Introduction(name:"山田", age:19, born:1995, hometown:"神奈川")

//クラスのプロパティに値を代入
//intro.name = "山田"
//intro.age = 19
//intro.born = 1995
//intro.hometown = "神奈川"

//temp()を実行
intro.temp()




