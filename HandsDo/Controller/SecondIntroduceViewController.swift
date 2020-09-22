//
//  SecondIntroduceViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 22.09.2020.
//

import UIKit

class SecondIntroduceViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationItem.title = "Как мы работаем"
        nextButton.layer.cornerRadius = 15
    }


}
