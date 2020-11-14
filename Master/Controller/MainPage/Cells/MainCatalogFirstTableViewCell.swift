//
//  MainCatalogFirstTableViewCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 09.10.2020.
//

import UIKit

class MainCatalogFirstTableViewCell: UITableViewCell {

    static let identifier = "MainCatalogFirstTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
