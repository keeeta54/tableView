//
//  ViewController.swift
//  tableView7
//
//  Created by 梶原敬太 on 2019/06/06.
//  Copyright © 2019 梶原敬太. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
//UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate を追加
    

    @IBOutlet weak var tableView: UITableView!
    
//    配列を準備
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //        tableViewをコードで書くときに必須
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    /*viewDidLoadは1回しか呼ばれない、画面が戻ってきたときには呼ばれない
     画面が戻って来たときに呼ばれるメソッドがUIkitがviewWillAppear*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//UserDefaultsのtodo
        if UserDefaults.standard.object(forKey: "todo") != nil {
            resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
//        下のデリゲートメソッドが呼ばれる
        tableView.reloadData()
    }

//    セクションの中のセルの数は増えて行くから配列の中身の数だけ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
//    セクションの数は1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    ここはセルが作られるたびに呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        セルのてテキストラベルのテキストに
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
//デリート機能 commit editingStyleというメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        もしeditingStyleがdeleteだったらresultArray配列のindexPath.row番目(触られた場所が012345と認識される)
        if editingStyle == .delete{
            
            resultArray.remove(at: indexPath.row)
//            上のやつで削除されてるので新しい配列を保存する
            UserDefaults.standard.set(resultArray, forKey: "todo")
//tableViewを更新する
            tableView.reloadData()
        }
    }
    
    
}

