//
//  OrderItem.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import Foundation

class OrderItem {
    private var _name: String!
    private var _size: String!
    private var _sweetnessPercentage: Double!
    private var _icePercentage: Double!
    private var _quantity: Int!
    
    init(name: String){
        _name = name
    }
    
    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var size: String{
        get{
            return _size
        }
        set{
            _size = newValue
        }
    }
    
    var sweetnessPercentage: Double{
        get{
            return _sweetnessPercentage
        }
        set{
            _sweetnessPercentage = newValue
        }
    }
    
    var icePercentage: Double{
        get{
            return _icePercentage
        }
        set{
            _icePercentage = newValue
        }
    }
    
    var quantity: Int {
        get{
            return _quantity
        }
        set{
            _quantity = newValue
        }
    }
    
}