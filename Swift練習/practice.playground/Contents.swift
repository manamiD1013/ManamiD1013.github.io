//: Playground - noun: a place where people can play

import UIKit

var value = -10
if value > 0{
    print("値は正です")
}else{
    print("値が負です")
}
 var value1 = 0
if value1 > 0{
    print("値が正です")
}else if value1 == 0{
    print("値は0です")
}else{
    print("値は負です")
}

var num = 10
switch(num){
case 1:
    print("値は1である")
case 2:
    print("値は2である")
case 3:
    print("値は3である")
default:
    print("値が大きすぎます")
}

var name = "三郎"
switch(name){
case "一郎", "二郎":
    print("彼の名前は一郎か二郎です")
case "三郎", "四郎":
    print("彼の名前は三郎か四郎です")
default:
    print("彼の名前は分かりません")
    
}

var num1 = 0
while (num1 <= 10){
    print(num1)
    num1 += 1
}

var num2 = 0
while (num2 < 100){
    num2 += 6
}
print("0に6を足していって、100より大きくて1番小さな数は\(num2)です")

var sum = 0
for i in 1...10{
    sum += i
}
print("1~10までの数を全て足したら値は\(sum)になります")

var sum1 = 0
for i in 1..<10{
    sum1 += i
}
print("1~9までの数を全て足したら値は\(sum1)になります")
