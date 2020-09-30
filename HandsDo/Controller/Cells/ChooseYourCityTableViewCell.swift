//
//  ChooseYourCityTableViewCell.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 29.09.2020.
//

import UIKit

class ChooseYourCityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ model: CitiesTable) {
        cityLabel.text = model.city
        descriptionLabel.text = model.description
    }
    
    
}
