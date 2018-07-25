//: Playground - noun: a place where people can play

import UIKit
//練習問題1
//以下の文字列の@@@となっている部分を上で定義した変数の式展開と置き換え、正しい文を出力
//print("私の名前は@@@です。生まれた月の数字と生まれた日にちを足すと＠＠＠になります。")
var name = "土井"
var birthMonth = 10
var birthDay = 13

print("私の名前は\(name)です。生まれた月の数字と生まれた日にちを足すと\(birthMonth+birthDay)になります。")

//練習問題2

//(1) 1869 ÷ 456 ÷ 2
var answer1 = 1869/456/2
print(answer1)
//(2) 5974 を 407で割った余り
var answer2 = 5974%407
print(answer2)
//(3) (78 + 450) × (4 + 36)
var answer3 = (78 + 450) * (4 + 36)
print(answer3)
//(4) 5124 を 9 で割った余りに、354 - 28 の結果をかける
var answer4 = (5124 % 9) * (354 - 28)
print(answer4)

//練習問題3
//配列型の変数aryに以下の値を入れた変数を定義
var ary:[Any] = ["yamada",60,"tanaka","sato"]

//問題1
//上で定義した配列型の変数aryを利用して、以下の(1)~(3)の値を出力
//(1)) "yamada"
print(ary[0])
//(2) "sato"
print(ary[3])
//(3) 60
print(ary[1])

//問題2
//上で定義した配列型の変数aryに以下の要素を追加して変数aryを出力
//maiki
ary.append("maiki")

//問題3
//(1)配列型の変数aryの要素の個数を出力
print(ary.count)
//(2)for文をつかって変数aryのすべての要素を出力
for i in ary{
    print(i)
}

//練習問題4
//以下の辞書型の変数を定義
var intro = ["name":"山田", "born":"japan", "hometown":"横浜"]

var scores = ["english":90, "japanese":50, "math":80]
//問題1
//上で定義した変数を利用して、次の値を出力
//(1)"山田"
print(intro["name"]!)
//(2)90
print(scores["english"]!)
//(3)scoresの合計点を値とする変数sumを新しく定義し、scoresの合計と平均を求め以下の@@@の部分と置き換え、正しい文章にして下さい。
//"山田の得点は合計@@@点で、平均点は@@@点です。"
var sum = scores["english"]! + scores["japanese"]! + scores["math"]!
print("山田の得点は合計\(sum)点で、平均点は\(sum/scores.count)点です。")

//問題2
//以下の要素を辞書型の変数scoresに追加してscoresを出力
//sciens 65
scores["science"] = 65;
print(scores)

//問題3
//(1)辞書型の変数scoresの要素の数を出力
scores.count
//(2)for文で辞書型の変数scoresのすべてのキーと値を以下の@@@となっている部分に正しく式展開して置き換えて下さい。
//"教科は@@@で得点は@@@点です"
for (subject,score) in scores{
    print("教科は\(subject)で得点は\(score)点です")
}

//練習問題5
//変数numを定義し、以下のような結果が得られるように値を変えて記述
//(1)numが０の場合とそうでない時
var num = 20
if(num == 0){
    print("値は0だよ")
}else{
    print("値は0ではないよ")
}
//(2)numが20より小さい、40より小さい、40より大きい時
if(num < 20){
    print("値は20より小さいよ")
}else if(num < 40){
    print("値は40より小さいよ")
}else{
    print("値は40より大きいよ")
}
//(3)numが10より大きい時、numから1引いた数を出力する
if(num > 10){
    print("10より大きい数から1を引いたよ")
    print(num-1)
}

//練習問題6
//switch文を使って、名前の判別
var name1 = "土井"
switch(name1) {
case "山田":
    print("私は山田という人を知っています")
case "松下":
    print("私は松下という人を知っています")
default:
    print("私はその人を知りません")
}

//練習問題7
//while文を使って、100から１までの数字を出力
var num1 = 100
while(num1>0){
    print(num1)
    num1 -= 1
}

//問題8
//(1)1から20までの数字をそれぞれ出力し、すべての処理が終わった後に、1から20までの合計値を出力
var sum1 = 0
for i in 1...20{
    sum1 += i
}
 print(sum1)

//(2)
var sum2 = 0
for r in 1..<20{
    sum2 += r
}
print(sum2)

//問題9

for num2 in 1...100{
    //3と5の倍数の時の処理
    if num2 % 3 == 0 && num2 % 5 == 0{
        print("FizzBuzz")
    //5の倍数の時の処理
    }else if num2 % 5 == 0{
        print("Buzz")
    //3の倍数の時の処理
    }else if num2 % 3 == 0{
         print("Fizz")
    //それ以外の処理
    }else{
        print(num2)
    }
}

//問題10
//100の約数の表示
for num3 in 1...100{
    if 100 % num3 == 0{
        print(num3)
    }
}
