//
//  CitiesTable.swift
//  HandsDo
//
//  Created by Igor Aryslanov on 30.09.2020.
//

import Foundation

struct CitiesTable: Codable {
    let city: String
    let description: String
    
    static let cityTemp = ["Краснодар", "Volgograd", "Arkhangelsk", "Brooklyn", "Samara", "Rostov on Don", "Ryazan", "Батуми", "Москва", "Texas", "Krasnodar", "Тампа", "Алушта", "Sochi", "Тюмень", "Тольяти"]
    static let descriptionTemp = ["Все услуги", "IKEA: соберём, установим, повесим", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "Все услуги", "IKEA и другая мебель: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим", "IKEA: соберём, установим, повесим"]
    
    static func getCitiesModel() -> [CitiesTable]{
        var dataModel = [CitiesTable]()
        
        for index in 0..<cityTemp.count {
            dataModel.append(CitiesTable(city: cityTemp[index], description: descriptionTemp[index]))
        }
        
        return dataModel
    }
    
    static var cityDictionary = [String : [String]]()
    static func getCityPrefix() -> [String] {
        var citySectionTitles = [String]()
        
        for city in cityTemp {
            let cityKey = String(city.prefix(1))
            if var cityValues = cityDictionary[cityKey] {
                cityValues.append(city)
                cityDictionary[cityKey] = cityValues
            } else {
                cityDictionary[cityKey] = [city]
            }
        }
        
        citySectionTitles = [String](cityDictionary.keys)
        citySectionTitles = citySectionTitles.sorted(by: <) // column of letters to the right
        
        return citySectionTitles
    }
    
    static func getCityDictionary() -> [String : [String]] {
        return cityDictionary
    }
    
    
}
