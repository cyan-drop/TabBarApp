//
//  ViewController.swift
//  TabBarApp
//
//  Created by 泉 on 2018/10/22.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var prefectureName: UILabel!
    var receiveCellName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefectureName.text = receiveCellName
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
