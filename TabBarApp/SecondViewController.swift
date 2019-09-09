//
//  SecondViewController.swift
//  TabBarApp
//
//  Created by cyan on 2018/10/22.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var historysTable: UITableView!
    @IBOutlet weak var historySearch: UISearchBar!
    
    var giveName: String = ""
    var historyItem:[String] = []
    var searchResults: [String] = []
    let defaultsName = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historySearch.delegate = self
        historySearch.enablesReturnKeyAutomatically = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if(historySearch.text == ""){
            searchResults = historyItem
        }else{
            
            
        
            for data in historyItem{
                if data.contains(historySearch.text!){
                    searchResults.append(data)
                }
            }
        }
        self.historysTable.reloadData()
        self.view.endEditing(true)
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue2", sender: nil)
        giveName = historyItem[indexPath.item]
        if searchResults != []{
            giveName = searchResults[indexPath.item]
        }else{
            giveName = historyItem[indexPath.item]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let historyList = defaultsName.object(forKey: "Name") as? [String] else {
            return
        }
        historyItem = historyList.reversed()
        self.historysTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchResults != []{
            return searchResults.count
        }else{
            return historyItem.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if searchResults != []{
            cell.historyLabel.text = searchResults[indexPath.item]
        }else{
            cell.historyLabel.text = historyItem[indexPath.item]
        }
        return cell
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue2" {
            let vc = segue.destination as! ViewController
            vc.receiveCellName = giveName
        }
    }


}

