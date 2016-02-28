//
//  SelectQuantityViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class SelectQuantityViewController: UIViewController {

    private var _currentStore: BobaStore!
    private var _currentOrderItem: OrderItem!
    private var _quantity: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Quantity"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "OrderComplete"){
//            _currentOrderItem.quantity = Get int value front text field
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
