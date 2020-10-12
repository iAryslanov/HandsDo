//
//  MainCatalogServiceCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 06.10.2020.
//

import UIKit

class MainCatalogServiceCell: UITableViewCell {
    
    @IBOutlet weak var iconServiceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ model: Services, index: Int) {
        serviceLabel.text = model.services[index]
        iconServiceImage.image = UIImage(named: model.services[index])
    }
    
    
}
