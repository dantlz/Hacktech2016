//
//  SelectSizeTableViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class SelectSizeTableViewController: UITableViewController {
    
    private var _currentStore: BobaStore!
    private var _currentOrderItem: OrderItem!
    private var _sizeOptions = ["Medium", "Large"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "How much boba?"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _currentOrderItem!.size = (tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!
        performSegueWithIdentifier("SelectPearls", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SelectPearlTableViewController
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SizeCell", forIndexPath: indexPath)
        cell.textLabel?.text = _sizeOptions[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _sizeOptions.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
