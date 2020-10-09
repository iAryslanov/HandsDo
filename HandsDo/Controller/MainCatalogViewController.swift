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
        Services(headerService: "Установить или починить", services: ["Мебель", "IKEA", "Бытовая техника", "Кондиционеры, вентиляция", "Конпьютеры, цифровая техника"]),
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
        
        serviceTableView.register(UINib(nibName: "MainCatalogServiceHeaderCell", bundle: nil), forCellReuseIdentifier: "MainCatalogServiceHeaderCell")
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
        let headerView = serviceTableView.dequeueReusableCell(withIdentifier: "MainCatalogServiceHeaderCell") as? MainCatalogServiceHeaderCell
        headerView?.headerServiceLabel.text = dataModel[section].headerService
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCatalogServiceCell", for: indexPath) as! MainCatalogServiceCell
        
        cell.serviceLabel.text = dataModel[indexPath.section].services[indexPath.row]
        cell.iconServiceImage.image = UIImage(named: dataModel[indexPath.section].services[indexPath.row])
        
        //        cell.configure(dataModel[indexPath.row])
        
        return cell
    }
    
    
}
