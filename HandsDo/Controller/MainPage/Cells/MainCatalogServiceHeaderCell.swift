//
//  MainCatalogServiceHeaderCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 07.10.2020.
//

import UIKit

class MainCatalogServiceHeaderCell: UITableViewCell {
    
    static let identifier = "MainCatalogServiceHeaderCell"
    
    @IBOutlet weak var headerServiceLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(_ model: Services) {
        headerServiceLabel.text = model.headerService
        headerServiceLabel.font = UIFont(name: "Avenir", size: 17.0)
        headerServiceLabel.textColor = #colorLiteral(red: 0.545365274, green: 0.5446301103, blue: 0.5665518641, alpha: 1)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
