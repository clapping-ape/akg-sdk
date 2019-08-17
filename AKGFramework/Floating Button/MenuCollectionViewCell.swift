//
//  MenuCollectionViewCell.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 18/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let cellFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        self.frame = cellFrame
    }
}
