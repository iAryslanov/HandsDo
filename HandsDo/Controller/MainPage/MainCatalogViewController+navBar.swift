//
//  MainCatalogViewController+navBar.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 21.10.2020.
//

import UIKit

extension MainCatalogViewController {
    
    func setupNavigationBarItems() {
        setupNabBar()
        setupLeftNavItem()
        setupRightNavItems()
    }
    
    private func setupNabBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.3215686275, blue: 0.6901960784, alpha: 1)
//        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0.3215686275, blue: 0.6901960784, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupLeftNavItem() {
        let masterLogo = UIImageView(image: #imageLiteral(resourceName: "navBarMainLogoButton"))
        masterLogo.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        masterLogo.contentMode = .scaleAspectFit
        
        let masterLabel = UILabel()
        masterLabel.font = UIFont(name: "Rubik-Regular", size: 12)
        masterLabel.text = "Мастер на все руки"
        masterLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        masterLabel.textAlignment = .left
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: masterLogo), UIBarButtonItem(customView: masterLabel)]
    }
    
    private func setupRightNavItems() {
        let cityButton = UIButton(type: .system)
        cityButton.frame = CGRect(x: 140, y: 0, width: 64, height: 14)
        cityButton.setTitle("cityLabel", for: .normal)
        cityButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let cityChevronDown = UIImageView(image: #imageLiteral(resourceName: "cityMainIndicatorDown"))
        cityChevronDown.frame = CGRect(x: 0, y: 0, width: 6, height: 10)
        cityChevronDown.contentMode = .scaleAspectFit
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "navBarMainDotButton").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 4, height: 16)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: menuButton), UIBarButtonItem(customView: cityChevronDown), UIBarButtonItem(customView: cityButton)]
    }
    
    
}
