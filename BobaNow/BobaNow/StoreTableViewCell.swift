//
//  StoreTableViewCell.swift
//  BobaNow
//
//  Created by Tianlin Zhang on 2/27/16.
//  Copyright © 2016 dantlz. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
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
