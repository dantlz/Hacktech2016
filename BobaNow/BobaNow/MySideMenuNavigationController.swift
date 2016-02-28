//
//  MySideMenuNavigationController.swift
//  BobaNow
//
//  Created by Xinghan Wang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class MySideMenuNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: MyMenuTableViewController(), menuPosition:.Left)
        sideMenu?.menuWidth = 160.0 // optional, default is 160
        // Do any additional setup after loading the view.
        sideMenu?.allowRightSwipe = false
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }

    


}
