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
        
        setNavigationBar()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.layer.cornerRadius = nextButton.layer.frame.size.height / 3.5
    }
    
    func setNavigationBar() {
        navigationItem.title = "Как мы работаем"
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    // MARK: - Navigation
    
    @IBAction func goToSecondIntroduceVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "SecondIntroduceViewController") as? SecondIntroduceViewController else { return }
        show(vc, sender: nil)
    }
    
    
}
