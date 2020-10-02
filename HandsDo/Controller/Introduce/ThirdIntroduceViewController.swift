//
//  ThirdIntroduceViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 22.09.2020.
//

import UIKit

class ThirdIntroduceViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.layer.cornerRadius = 15
        
    }
    
    func setNavigationBar() {
        navigationItem.setHidesBackButton(true, animated:false)

        // Custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 8, width: 20, height: 20))

        if let imgBackArrow = UIImage(named: "pinkChevronLeft") {
            imageView.image = imgBackArrow
        }
        view.addSubview(imageView)

        let backTap = UITapGestureRecognizer(target: self, action: #selector(backAction))
        view.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.title = "Как мы работаем"
    }
    
    @objc
    func backAction(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    @IBAction func goToAllowNotificationsVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "AllowNotificationsViewController") as? AllowNotificationsViewController else { return }
        show(vc, sender: nil)
    }
    
    
}
