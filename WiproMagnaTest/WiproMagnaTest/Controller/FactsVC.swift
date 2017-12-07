//
//  FactsVC.swift
//  WiproMagnaTest
//
//  Created by Samir Rathod on 07/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

import UIKit
import SDWebImage

class FactsVC: UITableViewController {
    var arrFacts: [FactModel] = [FactModel]()
    
    // MARK: -  View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl?.addTarget(self, action: #selector(self.pullToRefreshed), for: .valueChanged)
        
        self.tableView.separatorStyle = .none
        self.tableView.register(FactCell.self, forCellReuseIdentifier: "FactCell")
        
        getFactListCall()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Loading..."

        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FactsVC {
    // MARK: -  API Call Method
    func getFactListCall() {
        let url = URL.init(string: "\(Global.apiBaseURLPath)facts.json")
        let urlRequest = URLRequest(url: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: OperationQueue(), completionHandler: {(response: URLResponse?, data: Data?, error: Error?) -> Void in
            if (error == nil && data != nil) {
                let strData: String = String.init(data: data!, encoding: .ascii)!
                let tempData: Data = strData.data(using: .utf8)!
                
                let dictData: NSDictionary = try! JSONSerialization.jsonObject(with: tempData, options: .allowFragments) as! NSDictionary
                
                self.arrFacts.removeAll()
                
                if let arrData: NSArray = dictData.object(forKey: "rows") as? NSArray {
                    for i in 0 ..< arrData.count {
                        if let dictFact: NSDictionary = arrData.object(at: i) as? NSDictionary {
                            let modelObj = FactModel()
                            modelObj.strTitle = dictFact.object(forKey: "title") as? String ?? ""
                            modelObj.strDesc = dictFact.object(forKey: "description") as? String ?? ""
                            modelObj.strImgURL = dictFact.object(forKey: "imageHref") as? String ?? ""
                            
                            self.arrFacts.append(modelObj)
                        }
                    }
                    self.refreshControl?.endRefreshing()
                    DispatchQueue.main.async {
                        self.title = dictData.object(forKey: "title") as? String ?? ""
                        self.tableView.reloadData()
                    }
                }
            }
            else {
                self.title = "Error"
                self.refreshControl?.endRefreshing()
            }
        })
    }
    
    // MARK: -  Pull To Refresh Method
    func pullToRefreshed() {
        self.getFactListCall()
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
        
        let modelObj = arrFacts[indexPath.row]
        
        cell?.imgThumb?.sd_setImage(with: URL.init(string: modelObj.strImgURL), placeholderImage: #imageLiteral(resourceName: "imgPlaceholder"))
        cell?.lblTitle?.text = modelObj.strTitle
        cell?.lblDesc?.text = modelObj.strDesc
        
        cell?.sizeToFit()
        
        return cell!
    }
}

extension FactsVC {
    // MARK: -  Orientation Change Methods
    func orientationChanged() {
        self.tableView.reloadData()
    }
}
