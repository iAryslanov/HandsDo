//
//  MainCatalogServiceCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 06.10.2020.
//

import UIKit

class MainCatalogServiceCell: UITableViewCell {
    
    static let identifier = "MainCatalogServiceCell"
    
    @IBOutlet weak var iconServiceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(_ model: Services, index: Int) {
        serviceLabel.text = model.services[index]
        iconServiceImage.image = UIImage(named: model.services[index])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
