//
//  FirstIntroduceViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 22.09.2020.
//

import UIKit

class FirstIntroduceViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationItem.title = "Как мы работаем"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        nextButton.layer.cornerRadius = 15
    }
    
    // MARK: - Navigation
    @IBAction func goToSecondIntroduceVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "SecondIntroduceViewController") as? SecondIntroduceViewController else { return }
        show(vc, sender: nil)
    }
    
    
}
