//
//  AllowNotificationsViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 23.09.2020.
//

import UIKit

class AllowNotificationsViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var allowButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        allowButton.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    // MARK: - Navigation
    
    @IBAction func skipButtonGoToChooseYourCityVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "ChooseYourCityViewController") as? ChooseYourCityViewController else { return }
        show(vc, sender: nil)
    }
    
    @IBAction func goToChooseYourCityVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "ChooseYourCityViewController") as? ChooseYourCityViewController else { return }
        show(vc, sender: nil)
    }


}
