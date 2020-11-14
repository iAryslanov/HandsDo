//
//  MainNavigationController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 19.10.2020.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults().bool(forKey: Constants.isAppFirstOpen) {
            
            let storyboard = UIStoryboard(name: Constants.mainStoryboardID, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: Constants.chooseYourCityVCID) as? ChooseYourCityViewController else { return }
            show(vc, sender: nil)
            
        } else {
            
            let storyboard = UIStoryboard(name: Constants.mainStoryboardID, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: Constants.firstIntroduceVCID) as? FirstIntroduceViewController else { return }
            show(vc, sender: nil)
        }
    }
    
    
}
