//
//  SelectPearlTableViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class SelectPearlTableViewController: UITableViewController {

    private var _currentStore: BobaStore!
    private var _currentOrderItem: OrderItem!
    private var _pearlOptions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "What kind of pearls?"
        _pearlOptions = _currentStore.pearlList
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _currentOrderItem!.size = (tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)!
        performSegueWithIdentifier("SelectSweetness", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SelectSweetnessTableViewController
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
        let cell = tableView.dequeueReusableCellWithIdentifier("PearlCell", forIndexPath: indexPath)
        cell.textLabel?.text = _pearlOptions[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _pearlOptions.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
