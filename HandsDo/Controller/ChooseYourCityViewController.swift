//
//  ChooseYourCityViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 29.09.2020.
//

import UIKit

class ChooseYourCityViewController: UIViewController {
    
    let dataModel = CitiesTable.getCitiesModel()
    let dataModelPrefix = CitiesTable.getCityPrefix()
    let dataModelCityDictionary = CitiesTable.getCityDictionary()
    
    @IBOutlet weak var chooseYourCityTableView: UITableView! {
        didSet {
            chooseYourCityTableView.delegate = self
            chooseYourCityTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeaderLabel()
        setFooterImage()
        
        // Constraints
        NSLayoutConstraint.activate([
            
        ])
        
        chooseYourCityTableView.register(ChooseYourCityTableViewCell.nib(), forCellReuseIdentifier: ChooseYourCityTableViewCell.identifier)
    }
    
    func setHeaderLabel() {
        let headerLabel = UILabel()
        
        headerLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        headerLabel.numberOfLines = 2
        headerLabel.text = "Выберите свой город"
        headerLabel.textAlignment = .center
        headerLabel.textColor = #colorLiteral(red: 0.09628392011, green: 0.008938177489, blue: 1, alpha: 1)
        headerLabel.font = UIFont(name: "Avenir-Heavy", size: 40)
        
        chooseYourCityTableView.tableHeaderView = headerLabel
    }
    
    func setFooterImage() {
        let footerImage = UIImageView()
        
        footerImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150)
        footerImage.image = UIImage(named: "HandLogoChooseYourCityVC")
        footerImage.contentMode = .scaleAspectFit
        
        chooseYourCityTableView.tableFooterView = footerImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Navigation
    
    
}

// MARK: - Configure table

extension ChooseYourCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataModelPrefix[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? { // column of letters to the right
        return dataModelPrefix
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = dataModelPrefix.firstIndex(of: title) else { return -1 }
        return index
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModelPrefix.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cityKey = dataModelPrefix[section]
        if let cityValues = dataModelCityDictionary[cityKey] {
            return cityValues.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseYourCityTableViewCell.identifier, for: indexPath) as! ChooseYourCityTableViewCell
        
//        cell.configure(dataModel[indexPath.row])
        let cityKey = dataModelPrefix[indexPath.section]
        if let cityValues = dataModelCityDictionary[cityKey] {
            cell.cityLabel.text = cityValues[indexPath.row]
        }

        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseYourCityTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
