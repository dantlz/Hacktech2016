//
//  BobaStore.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import Foundation

class BobaStore {
    private var _name: String!
    private var _imagePath: String!
    private var _description: String!
    private var _costIncrease: Double!
    private var _bobaList = [String]()
    private var _pearlList = [String]()
    
    var name: String{
        return _name
    }
    
    var imagepath: String{
        return _imagePath
    }
    
    var description:String{
        return _description
    }
    
    var costIncrease:Double{
        return _costIncrease
    }
    
    var bobaList: [String]{
        return _bobaList
    }
    
    var pearlList:[String]{
        get{
            return _pearlList
        }
    }
    
    init(name: String, imagePath:String, description: String, costIncrease: Double, bobaList: [String], pearlList: [String]){
        _name = name
        _imagePath = imagePath
        _description = description
        _costIncrease = costIncrease
        _bobaList = bobaList
        _pearlList = pearlList
    }
}