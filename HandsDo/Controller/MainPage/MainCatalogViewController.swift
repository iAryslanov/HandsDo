//
//  MainCatalogViewController.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 02.10.2020.
//

import UIKit

class MainCatalogViewController: UIViewController {
    
    var dataModel = [
        Services(headerService: "Основные работы", services: ["Электрика", "Сантехника", "Мелкий ремонт"]),
        Services(headerService: "Ремонт и отделочные работы", services: ["Двери", "Окна, балконы, лоджии", "Стены", "Пол", "Потолок", "Проекты и сметы"]),
        Services(headerService: "Установить или починить", services: ["Мебель", "IKEA", "Бытовая техника", "Кондиционеры, вентиляция", "Компьютеры, цифровая техника"]),
        Services(headerService: "По комнатам", services: ["Гостиная", "Кухни", "Туалет и ванная", "Спальня", "Прихожая", "Кабинет"])
    ]
    
    @IBOutlet weak var serviceTableView: UITableView! {
        didSet {
            serviceTableView.delegate   = self
            serviceTableView.dataSource = self
        }
    }
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = "Услуга, проблема, предмет быта"
        navigationItem.titleView = searchBar
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        serviceTableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        serviceTableView.register(MainCatalogFirstTableViewCell.nib(), forCellReuseIdentifier: MainCatalogFirstTableViewCell.identifier)
        serviceTableView.register(MainCatalogServiceHeaderCell.nib(), forCellReuseIdentifier: MainCatalogServiceHeaderCell.identifier)
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
