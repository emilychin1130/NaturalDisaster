//
//  FirstAidViewController.swift
//  NaturalDisaster
//
//  Created by Emily Chin on 10/14/17.
//  Copyright © 2017 Emily Chin. All rights reserved.
//

import Foundation
import UIKit

class FirstAidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items: [FirstAid] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToFirstAidViewController(_ segue: UIStoryboardSegue) {
        
        self.items = CoreDataHelper.retrieveFirstAid()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = CoreDataHelper.retrieveFirstAid()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstAidCell") as! FirstAidCell
        
        let row = indexPath.row
        
        let item = items[row]
        
        cell.nameLabel.text = "\(item.name!)"
        
        cell.expDateLabel.text = "\(item.expDate!)"
        
        //        if habit.checked == true {
        //            cell.accessoryType = .checkmark
        //        } else
        //        {
        //            cell.accessoryType = .none
        //        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
