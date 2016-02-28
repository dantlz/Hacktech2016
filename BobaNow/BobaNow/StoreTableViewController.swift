//
//  StoreTableViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {
    
    private var _store: BobaStore!
    
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
        performSegueWithIdentifier("SelectSize", sender: tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SelectSizeTableViewController
    
        switch segue.identifier!{
        default:// "ItemSelected":
            let orderItem = OrderItem(name: sender! as! String)
            destination.setOrderItem(orderItem)
            destination.setStore(_store!)
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BobaNameCell", forIndexPath: indexPath)
        cell.textLabel?.text = _store?.bobaList[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_store?.bobaList.count)!
    }
}
