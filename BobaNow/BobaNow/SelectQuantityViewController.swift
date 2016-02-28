//
//  SelectQuantityViewController.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class SelectQuantityViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sweetnessLabel: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    @IBOutlet weak var quantityInputTextfield: UITextField!
    
    
    private var _currentStore: BobaStore!
    private var _currentOrderItem: OrderItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select Quantity"
        sizeLabel.text = _currentOrderItem.size
        sweetnessLabel.text = (String)(_currentOrderItem.sweetnessPercentage*100) + "%"
        iceLabel.text = (String)(_currentOrderItem.icePercentage*100) + "%"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "OrderComplete"){
            if(quantityInputTextfield.text != nil){
                _currentOrderItem.quantity = (Int)(quantityInputTextfield.text!)!
            }
            else{
                return
            }
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
