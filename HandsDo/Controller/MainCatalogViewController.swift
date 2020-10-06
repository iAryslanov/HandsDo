//
//  MainCatalogViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 02.10.2020.
//

import UIKit

class MainCatalogViewController: UIViewController {
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.placeholder = "Услуга, проблема, предмет быта"
        navigationItem.titleView = searchBar
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
}
