//
//  Todo.swift
//  ToDoApp
//
//  Created by 土井　麻菜美 on 2018/08/22.
//  Copyright © 2018年 Manami. All rights reserved.
//

import UIKit
//enum TodoPriority:Int {
//    case Low = 0
//    case Middle = 1
//    case High = 2
//
//    func color() -> UIColor{
//        switch self {
//        case .Low:
//            return UIColor(red:198/255,green:57/255,blue:120/255, alpha: 1)
//        case .Middle:
//            return UIColor(red:191/255,green:225/255,blue:131/255, alpha: 1)
//        case .High:
//            return UIColor(red:248/255,green:244/255,blue:129/255, alpha: 1)
//        }
//    }
//}

class Todo: NSObject {
    //Todoを保存するために必要なプロパティの作成
    var title = "" //Todoのタイトルを格納するための変数
    var descript = "" //Todoの詳細を格納するための変数
    var date = "" //Todoの締め切りを格納するための変数
    var id = "" //ローカル通知用のIDを格納するための変数
    var todoId:Int! //Todoのセル番号を格納するた目の変数
    //var priority:TodoPriority = .Low
    var todoDone: Bool = false //Todoを達成したかどうかの判定
    var isEditAble: Bool = false //Todoが編集可能かどうかの判定
    

    
    
    override init(){
        
    }
    required init?(coder aDecoder: NSCoder){
        
        todoDone = aDecoder.decodeBool(forKey: "todoDone")
    }
    func encode(with aCoder: NSCoder){
        
        aCoder.encode(todoDone,forKey: "todoDone")
    }
    
   
   
}
