//
//  MainViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

//
//  ViewController.swift
//  BobaNow
//
//  Created by Xinghan Wang on 2/27/16.
//  Copyright © 2016 Xinghan Wang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var bobaStoreList = [BobaStore]()
    var selectedStore: BobaStore?
    
    @IBOutlet weak var collection: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        
        //hard-coded data configure and init
        let halfandhalf = BobaStore(name: "Half and Half Tea House", imagePath: "halfnhalf", description: "This is a dope shit", costIncrease: 0.5, bobaList: ["taro milk tea", "original milk tea"], pearlList: ["boba","grass jelly"])
        let ozero = BobaStore(name: "Ozero", imagePath: "ozero", description: "This is a dope shit", costIncrease: 0.5,bobaList: ["taro milk tea", "original milk tea"], pearlList: ["boba","grass jelly"])
        let teabrick = BobaStore(name: "Tea Brick", imagePath: "teabrick", description: "This is a dope shit", costIncrease: 0.5,bobaList: ["taro milk tea", "original milk tea"], pearlList: ["boba","grass jelly"])
        let teastation = BobaStore(name: "Tea Station", imagePath: "teastation", description: "This is a dope shit", costIncrease: 0.5,bobaList: ["taro milk tea", "original milk tea"], pearlList: ["boba","grass jelly"])
        bobaStoreList.append(halfandhalf)
        bobaStoreList.append(ozero)
        bobaStoreList.append(teabrick)
        bobaStoreList.append(teastation)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var store:BobaStore!
        store = bobaStoreList[indexPath.row]
             performSegueWithIdentifier("StoreSelected", sender: store)
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "StoreSelected"{
                if let destination = segue.destinationViewController as? StoreTableViewController{
                    if let store = sender as? BobaStore{
                        print("hsadfahfh")
                        destination.setStore(store)
                    }
                }
            }
    
       }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let bobaStore = bobaStoreList[indexPath.row]
        
        if let cell = collection.dequeueReusableCellWithIdentifier("StoreCell") as? StoreTableViewCell{
            cell.configureCell(bobaStore)
            return cell
        }else{
            let cell = StoreTableViewCell()
            cell.configureCell(bobaStore)
            return cell
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bobaStoreList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

