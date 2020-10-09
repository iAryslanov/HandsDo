//
//  MainCatalogServiceHeaderCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 07.10.2020.
//

import UIKit

class MainCatalogServiceHeaderCell: UITableViewCell {
    
    @IBOutlet weak var headerServiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ model: Services) {
        headerServiceLabel.text = model.headerService
    }
    
    
}
