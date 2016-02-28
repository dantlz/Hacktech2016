//
//  StoreCell.swift
//  BobaNow
//
//  Created by Xinghan Wang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {

    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(store: BobaStore){
        nameLbl.text = store.name
        thumbImg.image = UIImage(named: "halfnhalf")
    }
}
