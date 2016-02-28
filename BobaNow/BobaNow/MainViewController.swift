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
    
    private var bobaStoreList = [BobaStore]()
    private var _allOrders = [OrderItem]()

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
        let bobatime = BobaStore(name: "Boba Time", imagePath: "teastation", description: "This is a dope shit", costIncrease: 0.5,bobaList: ["taro milk tea", "original milk tea"], pearlList: ["boba","grass jelly"])
        bobaStoreList.append(halfandhalf)
        bobaStoreList.append(ozero)
        bobaStoreList.append(teabrick)
        bobaStoreList.append(teastation)
        bobaStoreList.append(bobatime)
        
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        //hide navigation bar
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func  addTapped(){
        toggleSideMenuView()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var bobaStore: BobaStore!
        bobaStore = bobaStoreList[indexPath.row]
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        performSegueWithIdentifier("ShowSelected", sender: bobaStore)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowSelected"{
            if let storetablevc = segue.destinationViewController as? StoreTableViewController{
                if let bobaStore = sender as? BobaStore{
                    storetablevc.setStore(bobaStore)
                }
            }
        }
    }
    
    func addOrder(order: OrderItem){
        _allOrders.append(order)
    }
    

    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let bobaStore = bobaStoreList[indexPath.row]
        
        if let cell = collection.dequeueReusableCellWithIdentifier("StoreCell") as? StoreCell{
            cell.configureCell(bobaStore)
            return cell
        }else{
            let cell = StoreCell()
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

