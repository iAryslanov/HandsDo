//
//  ChooseYourCityViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 29.09.2020.
//

import UIKit

class ChooseYourCityViewController: UIViewController {
    
    let footerImage = UIImageView()
    var headerLabel = UILabel()
    
    //    var cities = [CitiesTable]()
    var cityDictionary = [String : [String]]()
    var citySectionTitles = [String]()
    var cities = ["Краснодар", "Volgograd", "Arkhangelsk", "Brooklyn", "Samara", "Rostov on Don", "Ryazan", "Батуми", "Москва", "Texas", "Krasnodar", "Тампа", "Алушта", "Sochi", "Тюмень", "Тольяти"]
    
    @IBOutlet weak var chooseYourCityTableView: UITableView! {
        didSet {
            chooseYourCityTableView.delegate = self
            chooseYourCityTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for city in cities {
            let cityKey = String(city.prefix(1))
            if var cityValues = cityDictionary[cityKey] {
                cityValues.append(city)
                cityDictionary[cityKey] = cityValues
            } else {
                cityDictionary[cityKey] = [city]
            }
        }
        
        citySectionTitles = [String](cityDictionary.keys)
        citySectionTitles = citySectionTitles.sorted(by: <)
        
        headerLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        headerLabel.numberOfLines = 2
        headerLabel.text = "Выберите свой город"
        headerLabel.textAlignment = .left
        headerLabel.textColor = #colorLiteral(red: 0.09628392011, green: 0.008938177489, blue: 1, alpha: 1)
        headerLabel.font = UIFont(name: "Avenir-Heavy", size: 40)
        
        footerImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150)
        footerImage.image = UIImage(named: "HandLogoChooseYourCityVC")
        footerImage.contentMode = .scaleAspectFit
        
        //        footer.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints
        NSLayoutConstraint.activate([
            
        ])
        
        chooseYourCityTableView.tableHeaderView = headerLabel
        chooseYourCityTableView.tableFooterView = footerImage
        
        
        chooseYourCityTableView.register(UINib(nibName: "ChooseYourCityTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseYourCityTableViewCell")
        chooseYourCityTableView.register(UINib(nibName: "ChooseYourCityHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseYourCityHeaderTableViewCell")
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
        return citySectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return citySectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return citySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cityKey = citySectionTitles[section]
        if let cityValues = cityDictionary[cityKey] {
            return cityValues.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseYourCityTableViewCell", for: indexPath) as! ChooseYourCityTableViewCell
        let cityKey = citySectionTitles[indexPath.section]
        if let cityValues = cityDictionary[cityKey] {
            cell.cityLabel.text = cityValues[indexPath.row]
        }
        
        //                cell.configure(<#Model#>[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseYourCityTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
