//
//  ContainerViewController.swift
//  ToDoApp
//
//  Created by 土井　麻菜美 on 2018/08/22.
//  Copyright © 2018年 Manami. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    var tableViewController: TodoListTableViewController!
    //TodoCollectionクラスのインスタンスを定義
    let todoCollection = TodoCollection.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //新規作成画面を開く
    @IBAction func newTodo(_ sender: UIButton) {
        self.performSegue(withIdentifier: "PresentNewTodoViewController", sender: self)
    }
}
