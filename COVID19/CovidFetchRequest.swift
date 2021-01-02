//
//  CovidFetchRequest.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/03.
//

import Foundation
import Alamofire
import SwiftyJSON


class CovidFetchRequest: ObservableObject {
    
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "1607a04f58msh09cc41c37d0e90cp180415jsn7502e4af8ab6",
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com"
    ]
    
    init() {
        getCurrentTotal()
        getAllCountries()
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
//                print(json)
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmad: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            
            if result != nil {
                
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary {
                    
                    let country = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmad: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(countryObject)
                }
            }
            
            self.allCountries = allCount.sorted(by: { $0.confirmad > $1.confirmad })
        }
    }
}
