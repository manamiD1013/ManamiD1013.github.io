//
//  TodeCollection.swift
//  ToDoApp
//
//  Created by 土井　麻菜美 on 2018/08/22.
//  Copyright © 2018年 Manami. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    //TodoCollectionクラスのインスタンスをシングルトンなインスタンスにする
    static let sharedInstance = TodoCollection()
    //Todoを複数管理するための配列の定義
    var todos: [Todo] = []
    var todoListsKey = "todoLists"
    //Todoを追加するためのメソッド
    func addTodoCollection(todo: Todo) {
        self.todos.append(todo)
        self.save()
    }
    func save () {
        var todoList: Array<Dictionary<String, Any>> = []
        //todo型のインスタンスを辞書型に変換
        for todo in todos {
            let todoDic = TodoCollection.convertDictionary(todo: todo)
            todoList.append(todoDic)
        }
        let defaults = UserDefaults.standard
        defaults.set(todoList, forKey: todoListsKey)
    }
    //todoの情報を取り出す
    func fetchTodos() {
        let defaults = UserDefaults.standard
        if let todoList = defaults.object(forKey: todoListsKey) as? Array<Dictionary<String, AnyObject>> {
            for todoDic in todoList {
                let todo = TodoCollection.convertTodoModel(attiributes: todoDic)
              self.todos.append(todo)
            }
        }
    }
    //todo型のインスタンスを辞書型に変換するためのクラス
    class func convertDictionary(todo: Todo) -> Dictionary<String, Any> {
        var dic = Dictionary<String, Any>()
        dic["title"] = todo.title as Any
        dic["descript"] = todo.descript as Any
        dic["date"] = todo.date as Any
        dic["id"] = todo.id as Any
        dic["todoDone"] = todo.todoDone as Any
        dic["isEditAble"] = todo.isEditAble as Any
        return dic as Dictionary<String, AnyObject>
    }
    //辞書型で保存されているTodoをTodoクラスのインスタンスに変換する
    class func convertTodoModel(attiributes: Dictionary<String, Any>) -> Todo {
        let todo = Todo()
        todo.title = (attiributes["title"] as? String)!
        todo.descript = (attiributes["descript"] as? String)!
        todo.date = (attiributes["date"] as? String)!
        todo.id = (attiributes["id"] as? String)!
        todo.todoDone = (attiributes["todoDone"] as? Bool)!
        todo.isEditAble = (attiributes["isEditAble"] as? Bool)!
        return todo
    }
}
