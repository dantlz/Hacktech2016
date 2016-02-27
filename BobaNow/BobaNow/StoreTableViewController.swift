//
//  StoreTableViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {
    
    private var _store: BobaStore?
    private var _selectedBoba: String?
    private var _allOrders = [OrderItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(_store != nil){
            self.navigationItem.title = _store?.name
        }
        
    }
    
    func setStore(store:BobaStore){
        _store = store
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _selectedBoba = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        performSegueWithIdentifier("ItemSelected", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SelectSizeTableViewController
        
        switch segue.identifier!{
        default:// "ItemSelected":
            let orderItem = OrderItem(name:_selectedBoba!)
            destination.setOrderItem(orderItem)
            destination.setStore(_store!)
            break
        }
    }
    
    @IBAction func unwindFromItemSpecifics(segue: UIStoryboardSegue){
        let ISCon = segue.sourceViewController as! SelectQuantityTableViewController
        
        if segue.identifier == "OrderComplete" {
            _allOrders.append(ISCon.getOrderItem())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoreViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = _store?.bobaList[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.numberOfRowsInSection(0)
    }


}
