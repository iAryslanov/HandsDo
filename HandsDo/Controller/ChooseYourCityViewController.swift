//
//  ChooseYourCityViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 29.09.2020.
//

import UIKit

class ChooseYourCityViewController: UIViewController {
    
    @IBOutlet weak var chooseYourCityTableView: UITableView! {
        didSet {
            chooseYourCityTableView.delegate = self
            chooseYourCityTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseYourCityTableView.register(UINib(nibName: "ChooseYourCityTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseYourCityTableViewCell")
        chooseYourCityTableView.register(UINib(nibName: "ChooseYourCityHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseYourCityHeaderTableViewCell")
        
//        chooseYourCityTableView.tableFooterView?.backgroundColor = UIColor(patternImage: UIImage(named: "HandLogoChooseYourCityVC.jpg")!)
    }
    
    
    // MARK: - Navigation
    
    
}

// MARK: - Configure table

extension ChooseYourCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseYourCityHeaderTableViewCell", for: indexPath) as! ChooseYourCityHeaderTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseYourCityTableViewCell", for: indexPath) as! ChooseYourCityTableViewCell
        
//                cell.configure(<#Model#>[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section"
//    }
    
    
}
