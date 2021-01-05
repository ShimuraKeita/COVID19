//
//  CountryStatisticsFetchRequest.swift
//  COVID19
//
//  Created by 志村　啓太 on 2021/01/05.
//

import Foundation
import Alamofire
import SwiftyJSON


class CountryStatisticsFetchRequest: ObservableObject {
    
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "1607a04f58msh09cc41c37d0e90cp180415jsn7502e4af8ab6",
        "x-rapidapi-host": "covid-193.p.rapidapi.com"
    ]
    
    init() {
        getStatsFor(country: "usa")
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                
                let json = JSON(result!)
               
                let country = json["response"][0]["country"].stringValue
                
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["tests"]["total"].intValue
                
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue

                self.detailedCountryData = DetailedCountryData(country: country, confirmadCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testDone: tests)

            }
        }
    }
}
