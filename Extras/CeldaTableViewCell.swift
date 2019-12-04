//
//  CeldaTableViewCell.swift
//  testXIB
//
//  Created by Daniel Alejandro on 9/14/19.
//  Copyright © 2019 Beto. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var Grupo: UILabel!
    @IBOutlet weak var hora: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
