//
//  MyMenuTableViewController.swift
//  BobaNow
//
//  Created by Xinghan Wang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class MyMenuTableViewController: UITableViewController {
    
    let menuItemNames = ["BobaNow!", "Account", "Payment Methods", "Address", "History"]
    var selectedMenuItem : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        //defeault select the first item in menu bar
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("menuitemCell")
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel?.text = menuItemNames[indexPath.row]

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == selectedMenuItem) {
            return
        }
        else{
            selectedMenuItem = indexPath.row
             let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
             var destViewController : UIViewController
             switch (indexPath.row) {
             case 0:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("BobaNowVC")
                break
             case 1:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AccountVC")
                break
             case 2:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("PaymentVC")
                break
             case 3:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AddressVC")
                break
             default:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("HistoryVC")
                break
            }
            sideMenuController()?.setContentViewController(destViewController)
        }
        
    }





}
