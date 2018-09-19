//
//  NewTodoViewController.swift
//  ToDoApp
//
//  Created by 土井　麻菜美 on 2018/08/22.
//  Copyright © 2018年 Manami. All rights reserved.
//

import UIKit
import UserNotifications
class NewTodoViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var dateField: UITextField!
    //それぞれの部品との関連づけ
    @IBOutlet var descriptionView: UITextView!

    @IBOutlet weak var todoField: UITextField!
    //TodoCollectionクラスのインスタンス
    let todoCollection = TodoCollection.sharedInstance
    let now = Date()
    var id = ""
    //datePickerの設定
    let datePicker = UIDatePicker()
    //Todoの内容を編集するための変数
    var editTodoTitle = ""
    var editDescription = ""
    var editDate = ""
    var editId = ""
    var editAble: Bool = false
    var pathId: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        //descriptionViewに枠線をつける
        descriptionView.layer.cornerRadius = 3
        descriptionView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        descriptionView.layer.borderWidth = 1
        //dateFieldに現在時刻を表示する
        let formatter =  DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let string = formatter.string(from: now)
        print(string)
        dateField.placeholder = string
        //タップをした際にキーボードを消すためのジェスチャー
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewTodoViewController.tapGesture(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
        todoField.delegate = self
        dateField.delegate = self
       // 日本の日付表示形式にする
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        datePicker.addTarget(self, action: #selector(NewTodoViewController.datePickerValueChange(sender:)), for: UIControlEvents.valueChanged)
        datePicker.minimumDate = now
        dateField.inputView = datePicker
        if editAble {
            if editDate != "No Setting" {
                // デフォルト日付
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                datePicker.date = formatter.date(from: editDate)!
                datePicker.minimumDate = now
         }
        }
        //DatePicker上のツールバーの設定
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let okButton: UIBarButtonItem = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.plain, target: self, action: #selector(tapOkButton(_:)))
        let cancelButton: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(tapCancelButton(_:)))
        //ツールバーにボタンを配置
        toolBar.setItems([cancelButton, spacer, okButton], animated: true)
        toolBar.barStyle = UIBarStyle.default  // スタイルを設定
        toolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // テキストフィールドにツールバーを設定
        dateField.inputAccessoryView = toolBar
        //編集モードの時に編集前の内容をそれぞれのテキストフィールドに表示したり、ローカル通知用のIDを指定
        todoField.text = self.editTodoTitle
        descriptionView.text = editDescription
        dateField.text = editDate
        id = editId
        // Do any additional setup after loading the view.
    }
    @objc func tapOkButton(_ sender: UIButton) {
        // キーボードを閉じる
        dateField.resignFirstResponder()
    }
    @objc func tapCancelButton(_ sender: UIButton) {
       if !editAble {
        // テキストフィールドを空にする
        dateField.text = ""
        }
        // キーボードを閉じる
        dateField.resignFirstResponder()
    }
    @objc func datePickerValueChange (sender: UIDatePicker) {
        //datePickerの表示の変更
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //datePickerで選択されている値をdateFieldに表示
        dateField.text = formatter.string(from: sender.date)
    }
    //タップした際の処理
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        todoField.resignFirstResponder()
        descriptionView.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        todoField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバーのタイトルを新規作成か編集かどうかで変更
        if !editAble {
            self.navigationItem.title = "新規作成"
        }else {
            self.navigationItem.title = "ToDoの編集"
        }
     self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController!.navigationBar.tintColor = UIColor.white
        //navigation barの左側に閉じるボタンを追加
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewTodoViewController.close))
        //navigation barの右側に保存ボタンを追加
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewTodoViewController.save))
    }
    @objc func close() {
        if todoField.text!.isEmpty {
            //新規作成画面を閉じる
            self.dismiss(animated: true, completion: nil)
        }else {
            let alert = UIAlertController(title: "Todoが保存されていません", message: "Todoを保存せずに最初の画面に戻りますか？", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                // okが押されたときの処理
                self.dismiss(animated: true, completion: nil)
            }
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action: UIAlertAction) in
            }
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func save() {
        //todoの内容があるかないか判定
        if todoField.text!.isEmpty {
            //アラートの処理
            //アラートの内容の編集
            let alertView = UIAlertController(title: "Todoが記述されていません", message: "Todoを記述して保存してください", preferredStyle: UIAlertControllerStyle.alert)
            //アラートにボタンを追加
            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //アラートを表示
            self.present(alertView, animated: true, completion: nil)
        }else {
            if !editAble {
               newSave()
            }else {
                editSave()
            }
        }
    }
    func newSave() {
        //todoの内容を保存するためのインスタンスの生成
        let todo = Todo()
        todo.title = todoField.text!
        todo.descript = descriptionView.text
        todo.date = dateField.text!
        todo.id = todoField.text! + dateField.text!
        todo.isEditAble = true
        print(todo.id)
        if dateField.text!.isEmpty {
            todo.date = "No Setting"
        }
        //addTodoCollectionの呼び出し
        self.todoCollection.addTodoCollection(todo: todo)
        print(self.todoCollection.todos)
        //保存して新規作成画面を閉じる
        self.dismiss(animated: true, completion: nil)
        //ローカル通知の設定
        if dateField.text!.isEmpty {
            print("日付を設定しないよ")
        }else {
            //datePickerの値をint型に変換
            let calendar = Calendar(identifier: .gregorian)
            let pickerDate = datePicker.date
            let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: pickerDate )
            let year = dateComponents.year!
            let month = dateComponents.month!
            let day = dateComponents.day!
            let hour =  dateComponents.hour!
            let minute = dateComponents.minute!
            //ローカル通知用の設定
            let content = UNMutableNotificationContent()
            content.title = "1件の通知"
            content.body = "「\(todoField.text!)」は終わっていますか？"
            content.sound = UNNotificationSound.default()
            // UNCalendarNotificationTrigger 作成
            let date = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
            let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
            // id, content, trigger から UNNotificationRequest 作成
            let request = UNNotificationRequest.init(identifier: "\(todo.id)", content: content, trigger: trigger)
            // UNUserNotificationCenter に request を追加
            let center = UNUserNotificationCenter.current()
            center.add(request)
        }
    }
    func editSave() {
        //編集前のローカル通知を削除
        let deleteId = id
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [deleteId])
        //取得したパスの番号のセルの内容を更新するための記述
        let editTodo = todoCollection.todos[pathId] //Todoを保存した配列の中にあるpathId番目の要素にアクセス
        editTodo.title = todoField.text! //Todoタイトルの更新
        editTodo.descript = descriptionView.text! //Todoディスクリプションの更新
        editTodo.date = dateField.text! //Todoの日にちを更新
        editTodo.id = todoField.text! + dateField.text! //通知用のIDの更新
        //TodoCollection内のsaveメソッドの更新
        todoCollection.save()
        if dateField.text! == "No Setting" {
            print("日付を設定しないよ")
        }else {
            //datePickerの値をint型に変換
            let calendar = Calendar(identifier: .gregorian)
            let pickerDate = datePicker.date
            let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: pickerDate )
            let year = dateComponents.year!
            let month = dateComponents.month!
            let day = dateComponents.day!
            let hour =  dateComponents.hour!
            let minute = dateComponents.minute!
            //ローカル通知用の設定
            let content = UNMutableNotificationContent()
            content.title = "1件の通知"
            content.body = "「\(todoField.text!)」は終わっていますか？"
            content.sound = UNNotificationSound.default()
            // UNCalendarNotificationTrigger 作成
            let date = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
            let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
            // id, content, trigger から UNNotificationRequest 作成
            let request = UNNotificationRequest.init(identifier: "\(editTodo.id)", content: content, trigger: trigger)
            // UNUserNotificationCenter に request を追加
            let center = UNUserNotificationCenter.current()
            center.add(request)
        }
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
