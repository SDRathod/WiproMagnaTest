//
//  FactsVC.swift
//  WiproMagnaTest
//
//  Created by Samir Rathod on 07/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit

class FactsVC: UITableViewController {
    var arrFacts: [FactModel] = [FactModel]()
    
    // MARK: -  View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FactsVC {
    // MARK: -  UITableView Datasource & Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFacts.count
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FactCell? = tableView.dequeueReusableCell(withIdentifier: "FactCell", for: indexPath) as? FactCell
        if cell == nil {
            cell = FactCell(style: .default, reuseIdentifier: "FactCell")
        }
        cell?.sizeToFit()
        
        return cell!
    }
}
