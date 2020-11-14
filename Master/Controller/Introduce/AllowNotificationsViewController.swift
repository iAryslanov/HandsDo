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
        allowButton.layer.cornerRadius = allowButton.layer.frame.size.height / 3.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: - Navigation
    
    @IBAction func skipButtonGoToChooseYourCityVC(_ sender: Any) {
        
        UserDefaults().setValue(true, forKey: Constants.isAppFirstOpen) // Setting the boolean key. App is open first time now.
        goNextVC()
    }
    
    @IBAction func goToChooseYourCityVC(_ sender: Any) {
        
        UserDefaults().setValue(true, forKey: Constants.isAppFirstOpen) // Setting the boolean key. App is open first time now.
        
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                // FIXME: - Add action here later.
                print("User has declined notifications from AllowNotificationsViewController")
                
                DispatchQueue.main.async {
                    self.goNextVC()
                }
            } else {
                DispatchQueue.main.async {
                    self.goNextVC()
                }
            }
        }
    }
    
    private func goNextVC() {
        let storyboard = UIStoryboard(name: Constants.mainStoryboardID, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: Constants.chooseYourCityVCID) as? ChooseYourCityViewController else { return }
        self.show(vc, sender: nil)
    }
    
}
