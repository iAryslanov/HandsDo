//
//  CabinetViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 02.10.2020.
//

import UIKit

class CabinetViewController: UIViewController {
    
    @IBOutlet weak var cityButton:    UIButton!
    @IBOutlet weak var getCodeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setNavigationBar()
        setGetButton()
    }
    
    func setNavigationBar() {
        navigationItem.title = "Кабинет"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func setGetButton() {
        getCodeButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        getCodeButton.setTitle("Получить код", for: .normal)
        getCodeButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        getCodeButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 21)
        getCodeButton.layer.cornerRadius = getCodeButton.layer.frame.size.height / 3.5
    }
    
    @IBAction func cityButton(_ sender: Any) {
        
    }
    
    @IBAction func getCode(_ sender: Any) {
        print(#function)
    }
    
    
}
