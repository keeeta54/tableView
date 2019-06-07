//
//  AddViewController.swift
//  tableView7
//
//  Created by 梶原敬太 on 2019/06/06.
//  Copyright © 2019 梶原敬太. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
//キーボードを出したり閉じたりしたいからUITextFieldDelegateを追加
    
//    todoを登録するString型の配列をつくる
    var array = [String]()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//textField.delegateを自分に持ってくる
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        
//        UserDefaultsに配列の状態で保存したものを配列の状態で取り出す
        if (UserDefaults.standard.object(forKey: "todo") != nil){
            array = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
//        取り出したの配列に追加して保存する
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey: "todo")
        
//        ボタンを押したら前の画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    
//    textFieldがもつデリゲートメソッドでUITextFieldDelegate書いたら使えるようになる
//    リターンキーが押されたらキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


