//
//  ViewController.swift
//  countUp
//
//  Created by 土井　麻菜美 on 2018/08/13.
//  Copyright © 2018年 Manami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberLabel.layer.cornerRadius = numberLabel.frame.width / 2
        numberLabel.layer.masksToBounds = true
        
        shapedIntoCircleButton(button: plusButton)
        shapedIntoCircleButton(button: clearButton)
        shapedIntoCircleButton(button: minusButton)
    }
    
    @IBAction func tapPlusButton(_ sender: UIButton) {
        print("プラスボタンがタップされました")
        number = number + 1
        numberLabel.text = String(number)
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        print("クリアボタンがタップされました")
        number = 0
        numberLabel.text = String(number)
    }
    
    @IBAction func tapMinusButton(_ sender: UIButton) {
        print("マイナスボタンがタップされました")
        number = number - 1
        numberLabel.text = String(number)
    }
    
    func shapedIntoCircleButton(button: UIButton){
        button.layer.cornerRadius = button.frame.width/2
        button.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

