//
//  MainCatalogViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 02.10.2020.
//

import UIKit

class MainCatalogViewController: UIViewController {
    
    var dataModel = Services.getServices()
    var cityLabel: String?
    
    @IBOutlet weak var serviceTableView: UITableView! {
        didSet {
            serviceTableView.delegate   = self
            serviceTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        setNavigationBar()
        
        serviceTableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        serviceTableView.register(MainCatalogFirstTableViewCell.nib(), forCellReuseIdentifier: MainCatalogFirstTableViewCell.identifier)
        serviceTableView.register(MainCatalogServiceHeaderCell.nib(), forCellReuseIdentifier: MainCatalogServiceHeaderCell.identifier)
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let label = UILabel()
        label.text = "Мастер на все руки"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .left
        
        var cityButton = UIBarButtonItem()
        cityButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: nil)
        cityButton.title = cityLabel
        cityButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        navigationItem.rightBarButtonItem = cityButton
        
        // Set search bar
        navigationItem.searchController = UISearchController()
        navigationItem.searchController?.searchBar.placeholder = "Услуга, проблема, предмет быта"
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

// MARK: - Configure table

extension MainCatalogViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel[section].services.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //        if section == 0 {
        //            return nil
        //        }
        
        let header = serviceTableView.dequeueReusableCell(withIdentifier: MainCatalogServiceHeaderCell.identifier) as! MainCatalogServiceHeaderCell
        
        header.configure(dataModel[section])
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //        if section == 0 {
        //            return CGFloat.leastNormalMagnitude
        //        }
        
        //        return section == 0 ? CGFloat.leastNormalMagnitude : 20
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if indexPath.row == 0 && indexPath.section == 0 {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: MainCatalogFirstTableViewCell.identifier, for: indexPath)
        //            return cell
        //        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCatalogServiceCell.identifier, for: indexPath) as! MainCatalogServiceCell
        
        cell.configure(dataModel[indexPath.section], index: indexPath.row)
        
        return cell
    }
}

extension MainCatalogViewController: ChooseYourCityViewControllerDelegate {
    
    func fillTheLabelWith(city: String) {
        cityLabel = city
    }
    
    
}
