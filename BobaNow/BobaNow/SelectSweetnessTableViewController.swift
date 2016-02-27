//
//  SelectSweetnessTableViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class SelectSweetnessTableViewController: UITableViewController {
    
    private var _currentStore: BobaStore!
    private var _currentOrderItem: OrderItem!
    private var _sweetnessOptions = [0.00, 0.50, 0.75, 1.00]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Sweetness Preferences"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _currentOrderItem!.sweetnessPercentage = Double((tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!)!
        performSegueWithIdentifier("SelectIce", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SelectIceTableViewController
        destination.setStore(_currentStore!)
        destination.setOrderItem(_currentOrderItem!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setStore(store: BobaStore){
        _currentStore = store
    }
    
    func setOrderItem(item: OrderItem){
        _currentOrderItem = item
    }
    
    func getOrderItem() -> OrderItem {
        return _currentOrderItem!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemSpecificViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = (String)(_sweetnessOptions[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.numberOfRowsInSection(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
