//
//  FirstViewController.swift
//  TabBarApp
//
//  Created by cyan on 2018/10/22.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellNames: [String] = ["北海道","青森", "岩手", "秋田", "山形", "宮城", "福島","新潟", "富山", "石川", "福井","長野","岐阜","山梨","愛知","静岡","栃木","茨城","千葉","東京","神奈川","埼玉","群馬","京都","大阪","滋賀","奈良","三重","和歌山","兵庫","岡山","広島","鳥取","島根","山口","愛媛","徳島","香川","高知","福岡","佐賀","長崎","大分","熊本","宮崎","鹿児島","沖縄"]
  
    let colors: [UIColor] = [UIColor.brown,UIColor.darkGray,UIColor.blue,UIColor.magenta, UIColor.purple,UIColor.orange,UIColor.red,UIColor.green,UIColor.cyan]
    
    var giveCellName: String = ""
    var randomColor: UIColor = UIColor.init()
    let defaultsName = UserDefaults.standard
    var historyItem: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        giveCellName = cellNames[indexPath.item]
        performSegue(withIdentifier: "Segue1", sender: nil)
        
        guard let badgeNum = defaultsName.object(forKey: "Badge") else {
            return
        }
        var badgeCount = badgeNum as! Int
        badgeCount += 1
        defaultsName.set(badgeCount, forKey: "Badge")
        self.tabBarController?.tabBar.items![1].badgeValue = String(badgeCount)
        historyItem.append(giveCellName)
        defaultsName.set(historyItem, forKey: "Name")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let historyList = defaultsName.object(forKey: "Name") as? [String] else {
            return
        }
        historyItem = historyList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        randomColor = colors[(Int)(arc4random_uniform(UInt32(colors.count)))]
        cell.cellLabel.textColor = randomColor
        cell.cellLabel.text = cellNames[indexPath.item]
        return cell
    }
   
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue1" {
            let vc = segue.destination as! ViewController
            vc.receiveCellName = giveCellName
        }
    }

    

}

